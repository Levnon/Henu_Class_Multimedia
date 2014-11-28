# -*- coding: utf-8 -*-
class LZW:
    before=""
    after=[]
    
    def Encoding(self):
        now_index=0
        for i in range(0,256):
            now_index+=1
            self.dict[chr(i)]=now_index
            self.dict_re[now_index]=chr(i)
        self.after=[]
        now_index=255
        s=""
        for i in self.before:
            temp=s+i
            if temp in dict :
                s+=i
            else:
                self.after.append(dict[s])
                now_index+=1
                dict[temp]=now_index
                s=i
        if s!="":
            self.after.append(dict[s])
        
    def Decoding(self):
        dict={}
        for i in range(0,256):
            dict[i]=chr(i)
        self.before=""
        now_index=255
        s=""
        entry=""
        for i in self.after:
            if i in dict:
                entry=dict[i]
            else:
                entry=s+s[0]
            self.before+=entry
            if s!="":
                now_index+=1
                dict[now_index]=s+entry[0]
            s=entry
            
if __name__ == '__main__':
    foo=LZW()
    foo.before="aabbbaabbabba"
    print(foo.before)
    foo.Encoding()
    print(foo.after)
    foo.Decoding()
    print(foo.before)
    
