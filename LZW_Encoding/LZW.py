# -*- coding: utf-8 -*-
class LZW:
    before=""
    after=[]
    dict={}
    dict_re={}
    
    def Encoding(self):
        now_index=0
        for i in self.before:
            if not( i in self.dict):
                now_index+=1
                self.dict[i]=now_index
                self.dict_re[now_index]=i
        self.after=[]
        now_string=""
        for i in self.before:
            now_string=now_string+i
            if not ( now_string in self.dict):
                now_index+=1
                self.dict[now_string]=now_index
                self.dict_re[now_index]=now_string
                temp=now_string[0:-1]
                last_index=self.dict[temp]
                self.after.append(last_index)
                now_string=now_string[-1]
        if not (now_string in self.dict):
            self.dict[now_string]=now_index+1
            self.dict_re[now_index+1]=now_string
        last_index=self.dict[temp]
        self.after.append(last_index)
                
    def Decoding(self):
        self.before=""
        for i in self.after:
            self.before+=self.dict_re[i]

if __name__ == '__main__':
    foo=LZW()
    foo.before="aabbbaabbabba"
    print(foo.before)
    foo.Encoding()
    print(foo.after)
    foo.Decoding()
    print(foo.before)
