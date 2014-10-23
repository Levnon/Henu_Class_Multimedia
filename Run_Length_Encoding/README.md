![RLE](http://ww1.sinaimg.cn/large/b1a2f383tw1ekzid6fk8qj20dc06omy1.jpg)
> [小金鱼儿](http://haoyu.de/?p=136)
<!--more-->
1. 什么是RLE
说来很简单。把相同的东西做成N*String。
比如，`AAABBBBCCCCC`，编码出来就是`A3B4C5`或者`3A4B5C`。基本思路就是如此。
2. 有啥优点呢？
2.1. 简单粗暴，容易理解，编码解码速度快。
2.2. 对于那种重复的很多的数据，编码起来很有效。
2.3. 好写。
2.4. 不丢失数据啊。
3. 有啥缺点呢？
对于下面这组数据：
`A-B-C-D-A-B-C-D`
编码结果是
`1-A-1-B-1-C-1-D-1-A-1-B-1-C-1-D`
反而比以前长了……编码后体积膨胀了。
我的理解是，行程编码没有字典……但是课上老师一直在把我们向“字典”方向引导，不知道是什么意思。
4. 改进？
4.1. 可以一次多位嘛……
    `A-B-C-D-A-B-C-D`
    `2-A-B-C-D`
4.2. 我们可以规定一下：
我们分别统计“这个数字描述的是要重复出现的东西还是不重复的东西”。
如果描述的是“要重复的东西”，那么这个数字表示后面字节的重复次数，这个数字的特征标志是“第一位为1”。
如果描述的是“不重复的东西”，那么这个数字表示后面不重复字节的长度，这个数字的特征标志是“第一位为0”。
举个栗子：
`A-A-A-A-B-B-C-C-C-C-C-C-A-B-C-A-B-C`
编码后：
`132-A-2-B-6-134-C-6-A-B-C-A-B-C`
其中132=128+4，134=128+6
4.3. 上面再加上优化：
8位，占用一位作为标志位，剩下7位了，最大范围是127。太少了……
那么就再规定一下：如果前面一直是“极限”，就继续往下面读，累加，直到一个“不是极限”的数字为止。这样就能安全地越过127这个坎儿了。
举例：
`255-255-128-A`
(255-128)+(255-128)+(128-128)=254
也就是254个A。
4.3. 评价：
能部分解决数据膨胀的问题……只是部分解决……
5. 代码实现
5.0. 说明
课上要求不限语言。于是我就用了Python。完全当作练习Python的文件读写了。一边查语法一边写的……
课上的要求是“用RLE将20个sql文件合并成一个文件”。涉及到多文件，不得不规定一下文件格式了。否则合并出来如何解出来啊？
对于合并后的文件规定如下：
```
haoyu{  //这是文件头，用于验证
    文件总个数（4字节）
    第一个文件的文件名长度（4字节）
    第一个文件的文件名
    第一个文件的长度（4字节）
    第一个文件的压缩后的长度
    第一个文件内容
    第二个文件的文件名长度（4字节）
    第二个文件的文件名
    第二个文件的长度（4字节）
    第二个文件的压缩后的长度
    第二个文件内容
}haoyu  //这是文件尾，用于验证（其实只是为了好看）
```
对于每一个文件的数据，如上所述
5.1.1 编码部分之文件读写部分
```
def encoding_file( inputFileDir = "data", outputFilename = "data.haoyu" , tempFilename = "haoyu.tmp" ):
    '函数：压缩文件。'
    with open( outputFilename, 'wb' ) as outData:
        # 写入文件头
        outData.write( b'haoyu{' )
        filenames = glob.glob( inputFileDir + "*" )
        print( '总文件数： ' + str( len( filenames ) ) )
        # 写入文件总个数信息（4字节）
        outData.write( struct.pack( "i", len( filenames ) ) )
        # 遍历每一个文件
        for filename in filenames:
            print( '正在处理文件： ' + filename )
            # 将文件进行编码，放到临时文件内
            # ===== 调用核心编码代码 开始 =====
            RLE_Encoding( filename, tempFilename )
            # ===== 调用核心编码代码 结束 =====
            # 将临时文件合并到主文件内：
            # 首先写文件信息
            # 先写入文件名长度，再写入文件名
            bFilename = filename.encode( "UTF-8" )
            bFilenameLen = len( bFilename )
            # 写入文件名大小信息（4字节）
            outData.write( struct.pack( "i", bFilenameLen ) )
            # 写入文件名
            outData.write( bFilename )
            # 写入原始文件长度（4字节）
            outData.write( struct.pack( "i", os.path.getsize( filename ) ) )
            # 写入编码后文件大小（4字节）
            outData.write( struct.pack( "i", os.path.getsize( tempFilename ) ) )
            # 打开编码后的文件
            with open( tempFilename, 'rb' ) as tmpInData:
                # 写入编码后的文件
                outData.write( tmpInData.read() )
            # 删除临时文件
            os.remove( tempFilename )
        # 写入文件尾
        outData.write( b'}haoyu' )
    print( '完成' )
```
5.1.2. 编码部分之最朴素的编码方案
```
def RLE_Encoding( filename, outputFilename ):
    fileSizeOriginal = os.path.getsize( filename )
    with open( filename, 'rb' ) as tmpInData:
        with open( outputFilename, 'wb' ) as tmpOutData:
            counter = 1
            old_string = ''
            for i in range( fileSizeOriginal ):
                # 每次读一个字节
                data_string = tmpInData.read( 1 )
                if old_string == data_string:
                    counter = counter + 1
                    if counter == 255:
                        tmpOutData.write( struct.pack( "B", counter ) )
                        tmpOutData.write( old_string )
                        counter = 0
                else:
                    if old_string == '':
                        old_string = data_string
                        counter = 1
                    else:
                        tmpOutData.write( struct.pack( "B", counter ) )
                        tmpOutData.write( old_string )
                        old_string = data_string
                        counter = 1
            tmpOutData.write( struct.pack( "B", counter ) )
            tmpOutData.write( old_string )
```
5.1.3. 编码部分之第二次改进后的编码方案
```
def RLE_Encoding( filename, outputFilename ):
    # 获取文件长度
    fileSizeOriginal = os.path.getsize( filename )
    # 打开文件
    with open( filename, 'rb' ) as tmpInData:
        with open( outputFilename, 'wb' ) as tmpOutData:
            nowCountingSame = False
            data_string = []
            for i in range( fileSizeOriginal ):
                # 每次读一位
                data_string.append( tmpInData.read( 1 ) )
                # 长度超过3
                if len( data_string ) >= 3:
                    # 如果现在正在收集相同的
                    if nowCountingSame :
                        # 如果新加入的和前面的相同
                        if ( data_string[-1] == data_string[-2] ):
                            # 直接略过
                            continue
                        # 否则就是出问题了，因为新加入的那个字节破坏了原来的连续性
                        else:
                            # 计算相同部分长度（除去新加入的那个就好了）
                            ouCounter = len( data_string ) - 1
                            # 输出重复次数（第一位为1）
                            while ouCounter >= 127 :
                                tmpOutData.write( struct.pack( "B", 255 ) )
                                ouCounter -= 127
                            tmpOutData.write( struct.pack( "B", ouCounter + 128 ) )
                            # 输出重复数据
                            tmpOutData.write( data_string[0] )
                            # 输出过后清空输出过的内容
                            data_string[0:-1] = []
                            # 说明现在在收集不同的
                            nowCountingSame = False
                            # OK上面事务完成，直接继续
                            continue
                    # 如果现在正在收集不同的
                    else:
                        # 如果出现三个连续相同的，那么说明该输出了
                        if ( data_string[-1] == data_string[-2] ) and ( data_string[-2] == data_string[-3] ):
                            # 计算长度
                            ouCounter = len( data_string ) - 3
                            # 根据第一位进行判断
                            while ouCounter >= 127 :
                                tmpOutData.write( struct.pack( "B", 127 ) )
                                ouCounter -= 127
                            tmpOutData.write( struct.pack( "B", ouCounter ) )
                            # 输出每一位
                            for j in range( len( data_string ) - 3 ):
                                tmpOutData.write( data_string[j] )
                            # 输出过后清空输出过的内容
                            data_string[0:-3] = []
                            # 说明现在在收集相同的
                            nowCountingSame = True
                            # OK上面事务完成，直接继续
                            continue
                        else:
                            continue
            ouCounter = len( data_string )
            if nowCountingSame :
                while ouCounter >= 127 :
                    tmpOutData.write( struct.pack( "B", 255 ) )
                    ouCounter -= 127
                tmpOutData.write( struct.pack( "B", ouCounter + 128 ) )
                # 输出字符
                tmpOutData.write( data_string[0] )
            else:
                while ouCounter >= 127 :
                    tmpOutData.write( struct.pack( "B", 127 ) )
                    ouCounter -= 127
                tmpOutData.write( struct.pack( "B", ouCounter ) )
                # 输出每一位
                for j in range( len( data_string ) ):
                    tmpOutData.write( data_string[j] )
```
5.2.0. 解码方案之文件读写部分
```
def decoding_file( inputFilename = "data.haoyu" ):
    with open( inputFilename, 'rb' ) as inData:
        # 读取文件头
        data_string = inData.read( 6 )
        # 判断是不是所支持的类型
        if data_string != b'haoyu{' :
            print( "不是有效的文件" )
            sys.exit( 1 )
        # 读取文件总个数
        numberOfFiles = struct.unpack( 'i', inData.read( 4 ) )[0]
        print( '总文件数： ' + str( numberOfFiles ) )
        # 依次解压缩每个文件
        for i in range( numberOfFiles ):
            # 读取文件名
            nameLengthOfFile = struct.unpack( 'i', inData.read( 4 ) )[0]
            nameOfFile = inData.read( nameLengthOfFile )
            nameOfFile = nameOfFile.decode( encoding = 'UTF-8', errors = 'strict' )
            print( "正在处理文件： " + nameOfFile )
            # 读取原始文件大小
            lengthOfOriginalFile = struct.unpack( 'i', inData.read( 4 ) )[0]
            # 读取编码后文件大小
            lengthOfEncodedFile = struct.unpack( 'i', inData.read( 4 ) )[0]
            # 获得文件完整路径
            nameOfFile = os.getcwd() + '' + nameOfFile
            # 截取文件目录和文件名
            ( dirname, filename ) = os.path.split( nameOfFile )
            # 判断文件夹是否存在
            if os.path.isdir( dirname ) == False:
                os, mkdir( dirname )
            # 创建文件
            with open( nameOfFile, 'wb' ) as outData:
                # ===== 核心解码代码 开始 =====
                # ===== 把核心代码放到这里 =====
                # ===== 核心解码代码 结束 =====
                
    print( '完成' )
```
5.2.1. 解码部分之最朴素的方案
```
                # 读取每一位
                for i in range( lengthOfEncodedFile // 2 ):
                    # print( str( i ) + '/' + str( lengthOfEncodedFile ) )
                    rpt = struct.unpack( 'B', inData.read( 1 ) )[0]
                    # print( rpt )
                    data = inData.read( 1 )
                    # print( data )
                    for times in range( rpt ):
                        outData.write( data )
```
5.2.2. 解码方案之第二次改进后的方案
```
                counter = 0
                while counter < lengthOfEncodedFile:
                    partLong = struct.unpack( 'B', inData.read( 1 ) )[0]
                    counter += 1
                    if  partLong > 127:
                        temp = partLong
                        partLong -= 128
                        while temp == 255:
                            temp = struct.unpack( 'B', inData.read( 1 ) )[0]
                            partLong += ( temp - 128 )
                            counter += 1
                        data = inData.read( 1 )
                        counter += 1
                        outData.write( data * partLong )
                    else:
                        temp = partLong
                        while temp == 127:
                            temp = struct.unpack( 'B', inData.read( 1 ) )[0]
                            partLong += temp
                            counter += 1
                        data = inData.read( partLong )
                        outData.write( data )
                        counter += partLong
```
5.3. 备注
    在改进的编码方案中，我定义了一个规则：如果重复次数为2，则认为它是不重复的。理由是，`A-A`编码成了`2-A`，长度并没有减少，所以这样做编码无意义。
    只能对整个文件夹里面的所有文件进行编码。不得有子文件夹。总长度不得大于2147483647字节。
6. 测试
    6.1. 使用朴素RLE编码：
    6.1.1. 编码给定的20个sql文件。编码前大小123kb。编码后大小120kb。
    6.2. 使用第二次改进的编码方案编码：
    6.2.1. 编码给定的20个sql文件。编码前大小123kb。编码后大小120kb。
    6.2.2. 编码一张白色底的580*271的bmp图片。编码前大小460kb。编码后大小34kb。
7. 参考资料
[维基百科](http://zh.wikipedia.org/wiki/%E6%B8%B8%E7%A8%8B%E7%BC%96%E7%A0%81)
[RLE行程长度编码压缩算法](http://blog.csdn.net/anzelin_ruc/article/details/9180525)