---
title: codeforces1954D
date: 2024-04-26 11:24:15
tags: codeforces
mathjax: true
categories: codeforces
---
[codeforces1954D](https://codeforces.com/contest/1954/problem/D)

## 题意
有 $n$ 种颜色的球， $i$ 种颜色的球的个数是 $a_i$ 。

这些球可以组合成一组。每组最多包含 $2$ 个球，每种颜色的球不超过 $1$ 个。

考虑所有 $2^n$ 组颜色。对于一组颜色，让我们把它的值表示为这些颜色的球所能分配到的最少组数。例如，如果有三种颜色，分别有 $3$ 、 $1$ 和 $7$ 个球，它们可以组合成 $7$ 组（且不少于 $7$ ），那么这组颜色的值就是 $7$ 。

你的任务是计算所有 $2^n$ 可能的颜色组的值之和。由于答案可能太大，请打印出以 $998\,244\,353$ 为模数的答案。

#### 输入

第一行包含一个整数 $n$ ( $1 \le n \le 5000$ ) - 颜色的数量。

第二行包含 $n$ 个整数 $a_1, a_2, \dots, a_n$ ( $1 \le a_i \le 5000$ ) - $i$ -th 颜色的球数。

输入的额外限制：球的总数不超过 $5000$ 。

#### 输出

打印一个整数 —— 所有 $2^n$ 组颜色的值之和，取模为 $998\,244\,353$ 。

## 分析
对于一个固定的颜色集合，这是一个标准问题，其解法如下：假设球的总数为 $s$ ，则集合的值为 $\left\lceil\frac{s}{2}\right\rceil$ ；但有一种例外情况，即有一种颜色的球数多于 $\frac{s}{2}$ ，那么值就是这种颜色的球数。

因此，答案只取决于是否有一种颜色的球数比其他颜色的球数总和还要多。

所以我们可以给各种颜色小球的数量排个序,然后枚举数量最多的小球有多少个,用背包统计之前选了 $x$ 个小球的方案数,然后就可以得到答案了。（因为是所有组合  $2^n$ 种，想到背包模型是关键）

 $dp[i]$ : 选了 $i$ 个小球的方案数


## Code
```c++
#include<iostream>
#include<algorithm>
using namespace std;
const long long N=3e5+10;

long long dp[N];
long long a[N];
long long mod = 998244353;
int main()
{
    long long n;
    cin>>n;
    for(long long i=1;i<=n;i++) cin>>a[i];
    
    sort(a+1,a+1+n);
    long long ans=0;
    dp[0]=1;
    for(long long i=1;i<=n;i++){
        for(long long j=0;j<=5000-a[i];j++){
            if(a[i]>j) ans=(ans+dp[j]*a[i])%mod;
            else ans=(ans+dp[j]*((j+a[i]+1)/2))%mod;
        }
        for(long long j=5000-a[i];j>=0;j--){
            dp[j+a[i]]=(dp[j+a[i]]+dp[j])%mod;
        }
    }
    cout<<ans%mod<<endl;
    return 0;
}
```






