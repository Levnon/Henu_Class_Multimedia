# -*- coding: utf-8 -*-
'''
Created on 2014年9月17日

@author: Yu

定义压缩文件的组结构：

haoyu{
在什么平台上创建的压缩文件
文件总个数（4字节）

第一个文件的文件名长度（4字节）
第一个文件的文件名
第一个文件的长度（4字节）
第一个文件的压缩后的长度
第一个文件内容

第二个文件……
}haoyu

中间结果输出到临时文件中。
'''
import glob
import os
import struct
import platform

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

def encoding_file( inputFileDir = "data", outputFilename = "data.haoyu" , tempFilename = "haoyu.tmp" ):
    '函数：压缩文件。'
    with open( outputFilename, 'wb' ) as outData:
        # 写入文件头
        outData.write( b'haoyu{' )
        # 判断并写入平台
        createPlatform=platform.system()
        createPlatformNumber=0
        slash= "/"
        if createPlatform=="Windows":
            slash="\\"
            createPlatformNumber=1
        elif createPlatform=="Linux":
            slash="/"
            createPlatformNumber=2
        else:
            slash="/"
            createPlatformNumber=0
        outData.write( struct.pack( "i", createPlatformNumber ) )
        # 获取所有文件信息
        filenames = glob.glob( inputFileDir +slash+"*" )
        print( '总文件数： ' + str( len( filenames ) ) )
        # 写入文件总个数信息（4字节）
        outData.write( struct.pack( "i", len( filenames ) ) )
        # 遍历每一个文件
        for filename in filenames:
            print( '正在编码文件： ' + filename )
            # 将文件进行编码，放到临时文件内
            RLE_Encoding( filename, tempFilename )
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


if __name__ == '__main__':
    # inputFileDir = input( "文件所在文件夹：" )
    # outputFilename = input( "压缩后的文件名：" )
    # encoding_file( inputFileDir, outputFilename )
    encoding_file()
