---
title: codeforces1870C
date: 2023-09-07 21:21:59
tags: codeforces
mathjax: true
categories: codeforces
---
[codeforces1870C][def]

## 题意
给你两个整数 $n$ 和 $k$。同时给你一个大小为 $n$的整数数组 $a_1, a_2, \ldots, a_n$。已知对于所有 $1 \leq i \leq n$， $1 \leq a_i \leq k$.

定义大小为 $n \times n$的二维数组 $b$如下：$b_{i, j} = \min(a_i, a_j)$.将数组$b$表示为一个正方形，其中左上角的单元格为$b_{1, 1}$，行的编号从上到下从$1$到$n$，列的编号从左到右从$1$到$n$。让一个单元格的颜色就是写在其中的数字(坐标为$(i, j)$的单元格的颜色是$b_{i, j}$) .

对于从 $1$ 到 $k$ 的每种颜色，找出数组 $b$ 中包含该颜色所有单元格的最小矩形。输出该矩形的宽和高之和 .

## 方法 一
$b_{i,j} =\min(a_i, a_j)$ $->$求$a[i]$最左边和最右边大于等于$a[i]$的数的下标, 即$ans[i]=(ri[i]-li[i]+1)*2$ 。

```c++
#include<iostream>
#include<vector>
using namespace std;
const int N=100005;
int le[N],ri[N];
int main()
{
    int t;
    cin>>t;
    while(t--){
        int n,k;
        cin>>n>>k;
        vector<int>a(n+1);
        vector<bool>st(k+1);
        for(int i=1;i<=n;i++) cin>>a[i],st[a[i]]=true;
        int now=0;
        for(int i=1;i<=n;i++){
            while(now<a[i]) le[++now]=i; //求最左边大于等于a[i]的数的下标
        }
        now=0;
        for(int i=n;i>=1;i--){
            while(now<a[i]) ri[++now]=i; //求最右边大于等于a[i]的数的下标
        }
        for(int i=1;i<=k;i++){
            cout<<(st[i]?(ri[i]-le[i]+1)*2:0)<<" ";
        }
        cout<<endl;
    }
    return 0;
}

```

[def]: https://codeforces.com/problemset/problem/1870/C