'''
Created on 2014-11-27
@author: haoyu
'''

class Searcher( object ):

    def __init__( self, invertedFile, ranker ):
        self.invertedFile = invertedFile
        self.ranker = ranker

    def search( self ):
        rawWords = input( "输入要查询的单词：" ).split()
        words = list( rawWords )
        word = words.pop()
        result = self.invertedFile.listOut( word )
        result = self.ranker.getRank( word = word, arr = result )
        for word in words:
            singleWordSearchResult = self.invertedFile.listOut( word )
            singleWordSearchResult = self.ranker.getRank( word = word, arr = singleWordSearchResult )
            result = self.__mergeTheResult( result, singleWordSearchResult )
        self.__showResult( words = rawWords, result = result )

    def __mergeTheResult( self, lastTimeResult, thisTimeResult ):
        temp = {}
        for filename in lastTimeResult.keys():
            if filename in thisTimeResult:
                temp[filename] = lastTimeResult[filename] + thisTimeResult[filename]
        return temp

    def __showResult( self, words, result ):
        print( "查询结果：" )
        if len( result ) == 0:
            if len(words)==1:
                print( "\t没找到包含" + str( words ) + "的文件" )
            else:
                print( "\t没找到同时包含" + str( words ) + "的文件" )
        else:
            temp = sorted( result.items(), key = lambda x:x[1], reverse = True )
            for ( file, rank ) in temp:
                print( "\t" + file + "\t=>\t" + str( rank ) )
        print()
