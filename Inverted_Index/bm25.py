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

    k1 = 2
    k2 = 5
    b = 0.75

    def __init__( self, referance ):
        self.referance = referance

    def getRank( self, word, arr ):
        for filename in arr.keys():
            f = self.referance.contains[word][filename]
            idf = math.log( self.referance.files / len( self.referance.contains[word] ) )
            arr[filename] = ( idf * f * ( self.k1 + 1 ) ) / ( f + self.k1 * ( 1 - self.b + self.b * self.k2 ) )
        return arr
