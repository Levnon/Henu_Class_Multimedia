'''
Created on 2014-11-27
@author: haoyu
'''
from inverted_index import InvertedIndex
from searcher import Searcher
from tfidf import TF_IDF
from bm25 import BM25

if __name__ == '__main__':
    dir = "data"
    rankerUse = "TF-IDF"
    rankerAvailable = {"TF-IDF":TF_IDF, "BM25":BM25}

    invertedFile = InvertedIndex()
    invertedFile.makeTextIndexFromFloder( dir )

    ranker = rankerAvailable[rankerUse]( invertedFile )
    searcher = Searcher( invertedFile, ranker )
    # print(invertedFile.times)
    # print( invertedFile.contains )
    while True:
        searcher.search()
