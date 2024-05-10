---
title: codeforces882D
date: 2023-09-07 21:21:59
tags: codeforces
mathjax: true
categories: codeforces
---
[codeforces1870C](https://codeforces.com/problemset/problem/882/D)
连续 $n$ 个数字里边必有能整除 $n$ 的数字 , 所以只需从 $1$ 开始枚举 .

```C++
#include<iostream>
using namespace std;
int main()
{
    int t;
    cin>>t;
    while(t--){
        long long int n;
        cin>>n;
        int ans=0;
        for(int i=1;i<=n;i++){
            if(n%i==0) ans++;
            else break;
        }
        cout<<ans<<endl;
    }
    return 0;
}
```
