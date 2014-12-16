# -*- coding: utf-8 -*-
class LZW:
    before=""
    after=[]
    
    def Encoding(self):
        dict={}
        now_index=0;
        for i in range(1,256):
            now_index+=1
            dict[chr(now_index)]=now_index
        self.after=[]
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
        now_index=0
        for i in range(1,256):
            now_index+=1
            dict[now_index]=chr(now_index)
        self.before=""
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
    # foo.before="The quick brown fox jumps over the lazy dog."
    foo.before=input("Input a string:")
    print(foo.before)
    foo.Encoding()
    print(foo.after)
    foo.Decoding()
    print(foo.before)