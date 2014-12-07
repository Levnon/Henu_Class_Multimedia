'''
Created on 2014-11-27
@author: haoyu
'''
import math

class BM25( object ):
    """
        This is the BM25 ranking method.
    """
    name = "BM25"

    def __init__( self, referance ):
        self.referance = referance
        self.k1 = 2
        self.k2 = referance.words / referance.files
        self.b = 0.75

    def getRank( self, word, arr ):
        for filename in arr.keys():
            f = self.referance.contains[word][filename]
            idf = math.log( self.referance.files / len( self.referance.contains[word] ) )
            arr[filename] = ( idf * f * ( self.k1 + 1 ) ) / ( f + self.k1 * ( 1 - self.b + self.b * self.k2 ) )
        return arr
