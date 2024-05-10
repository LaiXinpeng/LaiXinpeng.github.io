---
title: codeforces1920D.md
date: 2024-02-03 06:04:49
tags: codeforces
mathjax: true
categories: codeforces
---
[codeforces1920D](https://codeforces.com/contest/1920/problem/D)

```c++
#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
typedef uint64_t ll;
const int N=200010;
const ll INF=1e18;
ll lst[N];
ll num[N];
int n,q;

void qurray(ll x){
   while(true){
      ll pos=upper_bound(num+1,num+n+1,x)-num;
      if(pos==1){
         cout<<lst[1]<<endl;
      }
      if(x%num[pos-1]==0){
         cout<<lst[pos-1]<<" ";
         return;
      }
      x%=num[pos-1];
   }
}

int main()
{
   int t;
   cin>>t;
   while(t--){
      cin>>n>>q;
      for(int i=1;i<=n;i++){
         ll op,x;
         cin>>op>>x;
         if(op==1){
            num[i]=num[i-1]+1;
            lst[i]=x;
         }else{
            ll a=x+1;
            if(num[i-1]!=0){
               a=min(a,INF/num[i-1]+1);
            }
            num[i]=num[i-1]*a;
            lst[i]=lst[i-1];
         }
      }
      while(q--){
         ll x;
         cin>>x;
         qurray(x);
      }
      cout<<endl;
   } 
   return 0;
}
```
