'''
Created on 2014-11-27
@author: haoyu
'''
import math

class TF_IDF( object ):
    """
        This is the TF-IDF ranking method.
    """
    name = "TF-IDF"

    def __init__( self, referance ):
        self.referance = referance

    def getRank( self, word, arr ):
        for filename in arr.keys():
            tf = self.referance.contains[word][filename] / self.referance.fileLength[filename]
            idf = math.log( self.referance.files / len( self.referance.contains[word] ) )
            arr[filename] = tf * idf
        return arr
