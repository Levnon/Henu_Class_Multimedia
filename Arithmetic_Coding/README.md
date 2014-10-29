![ArithmeticCoding]()
> [小金鱼儿]()
<!--more-->

1. 什么是算数编码？

	算术编码，是图像压缩的主要算法之一。 是一种无损数据压缩方法，也是一种熵编码的方法。和其它熵编码方法不同的地方在于，其他的熵编码方法通常是把输入的消息分割为符号，然后对每个符号进行编码，而算术编码是直接把整个输入的消息编码为一个数，一个满足(0.0 ≤ n < 1.0)的小数n。

	按照我的理解，就是利用了区间可以无限细分的原理。将字符串映射到某一个区间内。

2. 编码原理？

	下面以序列 `abca` 为例分析编码原理：

	1. 统计字符出现次数，并算出概率：
	
	| 字符  | 次数 | 概率 |
	| :---: | :--: | :--: |
	| a | 2 | 0.5  |
	| b | 1 | 0.25 |
	| c | 1 | 0.25 |
	
	2. 依据概率，将 [0~1) 区间进行划分
	
	| 字符  | 次数 | 概率 | 分配到的区间 |
	| :---: | :--: | :--: | :--: | 
	| a | 2 | 0.5  | [0,0.5) |
	| b | 1 | 0.25 | [0.5,0.75) |
	| c | 1 | 0.25 | [0.75,1) |
	
	3. 开始编码
		
		每一次操作都是在上一次操作完成后的区间基础上进行操作
		
		初始时候“旧区间”取 [0,1) , Low=0，High=1，区间长度=High-Low=1
		
		新区间的Low=旧区间的Low+本次需要处理的字符的Low*旧区间长度
		
		新区间的High=旧区间的Low+本次需要处理的字符的High*旧区间长度
		
		重复，直到所有字符被编码完毕，会得到一个区间[low,High)，这其中的任何一个值都可以作为编码结果
	
2. 有啥优点呢？
	
	信息无损	,在没有对应表的条件下根本不知道数据是啥
	
	上面的编码过程里面，用的是最简单的编码方案。1其实叫“建模”。使用不同方法得出的模型会影响到后续编码的质量。
	
	例如，当前符号出现的概率可能会受之前出现符号的影响，这时候之前出现的符号，也被称为上下文。比如在英文文档编码的时候，在字母Q或者q出现之后，字母u出现的概率就大大提高了。这种模型还可以进行自适应的变化，即在某种上下文下出现的概率分布的估计随着每次这种上下文出现时的符号而自适应更新，从而更加符合实际的概率分布。不管编码器使用怎样的模型，解码器也必须使用同样的模型。多种编码模型使得编码更加灵活。
	
	所以知道了这一点，我们的这个最简单的模型还可以再进行简化：平均分配长度。a，b，c均占$\dfrac{1}{3}$.这样编码也是可行的。
	
	
3. 有时所缺点呢？

	一些模型必须依赖统计，所以不能“时时编码”，只能以下给出所有数据，然后进行编码。
	
	不能实现查找。

4. 代码实现

```python

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

```	
	
6. 参考资料

	老师的PPT
	
