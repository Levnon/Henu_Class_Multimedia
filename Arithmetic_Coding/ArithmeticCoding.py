# -*- coding: utf-8 -*-
'''
Created on 2014年10月20日

@author: Yu
'''
class ArithmeticCoding:
    myString=""
    myResult=0
    low={}
    high={}
    length=0
    def Encoding(self):
        self.myResult=0
        self.length=len(self.myString)
        # Counting
        table = {}
        for ch in self.myString:
            if ch in table:
                table[ch] += 1
            else:
                table[ch] = 1
        # Calculate the low and high
        rate = (1 / len(self.myString))
        tempHigh = 0
        for ch in table:
            self.low[ch] = tempHigh
            tempHigh += (table[ch] * rate)
            self.high[ch] = tempHigh
        # Encoding
        nowLow = nowHigh = lastLow = 0
        lastHigh = 1
        for ch in self.myString:
            nowLow = lastLow + self.low[ch] * (lastHigh - lastLow)
            nowHigh = lastLow + self.high[ch] * (lastHigh - lastLow)
            lastLow = nowLow
            lastHigh = nowHigh
        # store the answer
        # NOTICE: Each real numbers in range [low,high) can be the number
        self.myResult=(nowLow+nowHigh)/2
        
    def Decoding(self):
        # This function requires the encoding result arrays: low and high 
        # and also requires the length of the string
        self.myString=""
        answer=""
        nowLow = nowHigh = lastLow = 0
        lastHigh = 1
        for i in range(self.length) :
            for ch in self.high.keys():
                nowLow = lastLow + self.low[ch] * (lastHigh - lastLow)
                nowHigh = lastLow + self.high[ch] * (lastHigh - lastLow)
                if (nowLow<=self.myResult) & (nowHigh>self.myResult):
                    answer=answer+ch
                    lastLow = nowLow
                    lastHigh = nowHigh
                    break
        self.myString=answer
    def debug(self):
        print(self.low)
        print(self.high)
        
if __name__ == '__main__':
    foo=ArithmeticCoding()
    foo.myString="This is a test"
    foo.Encoding()
    print('The string is "'+foo.myString+'"')
    print("The encoding result is:"+str(foo.myResult))
    foo.Decoding()
    print("The decoding result is:"+str(foo.myString))
