'''
Created on 2014-11-27
@author: haoyu
'''

import glob

class InvertedIndex( object ):
    contains = {}
    fileLength = {}
    files = 0
    words = 0

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
        tdict = {}
        self.fileLength[filename] = 0
        with open( filename, mode = 'r' ) as inputer:
            tempFile = inputer.read().split()
            self.words+=len(tempFile)
            self.fileLength[filename]=len(tempFile)
            for word in tempFile:
                if word in tdict:
                    tdict[word] += 1
                else:
                    tdict[word] = 1
        self.__mergeSmallTables( filename, tdict )

    def __mergeSmallTables( self, filename, tdict ):
        for key, value in tdict.items():
            # make the inverted index file
            if not key in self.contains:
                self.contains[key] = {}
            self.contains[key][filename] = value
