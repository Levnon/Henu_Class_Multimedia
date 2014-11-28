'''
Created on 2014-11-27
@author: haoyu
'''

import glob
import os
import struct

class InvertedIndex( object ):
    times = {}
    contains = {}
    files = 0

    def __init__( self ):
        self.times = {}
        self.contains = {}

    def makeTextIndexFromFloder( self, floderDir ):
        filenames = glob.glob( floderDir + "/*" )
        self.files = len( filenames )
        for filename in filenames:
            self.__forSingleFile( filename )
        print( "已从 " + str( self.files ) + " 个文件中读取信息。" )
        print()

    def listOut( self, word ):
        if word in self.contains:
            return self.contains[word]
        else:
            return {}

    def __forSingleFile( self, filename ):
        print( "正在处理文件 " + filename + "..." )
        dict = {}
        with open( filename, mode = 'r' ) as inputer:
            tempFile = inputer.read().split()
            for word in tempFile:
                if word in dict:
                    dict[word] += 1
                else:
                    dict[word] = 1
        self.__mergeSmallTables( filename, dict )

    def __mergeSmallTables( self, filename, dict ):
        for key, value in dict.items():
            # counting how many files one word appears in
            if key in self.times:
                self.times[key] += 1
            else:
                self.times[key] = 1
            # make the inverted index file
            if not key in self.contains:
                self.contains[key] = {}
            self.contains[key][filename] = value
