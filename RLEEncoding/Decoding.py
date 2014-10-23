# -*- coding: utf-8 -*-
'''
Created on 2014年9月17日

@author: Yu
'''
from binascii import b2a_hex
from nt import mkdir
import os
import string
import struct
import sys


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
            nameOfFile = os.getcwd() + '\\' + nameOfFile
            # 截取文件目录和文件名
            ( dirname, filename ) = os.path.split( nameOfFile )
            # 判断文件夹是否存在
            if os.path.isdir( dirname ) == False:
                os, mkdir( dirname )
            # 创建文件
            with open( nameOfFile, 'wb' ) as outData:

                # ===== =====
                # 解码过程
                # ===== =====

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
    print( '完成' )


if __name__ == '__main__':
    # inputFilename = input( "文件名:" )
    # decoding_file( inputFilename )
    decoding_file()
