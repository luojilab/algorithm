

## 最长公共子序列



### 1.概念解释

一个数列![S](https://wikimedia.org/api/rest_v1/media/math/render/svg/4611d85173cd3b508e67077d4a1252c9c05abca2)，如果分别是两个或多个已知[数列](https://www.wikiwand.com/zh-hans/数列)的子序列，且是所有符合此条件序列中最长的，则![S](https://wikimedia.org/api/rest_v1/media/math/render/svg/4611d85173cd3b508e67077d4a1252c9c05abca2)称为已知序列的最长公共子序列

例如：序列<A,B,C,B,A>，<A,B,B,A,C>,则可以有子序列<A,B>,<A,B,B>,<A,B,B,A>,其中<A,B,B,A>就是这两个序列中最长的公共子序列



<img src="/res/Dynamic_Programming/str1.jpg" width ="30%">

<img src="/res/Dynamic_Programming/str2.jpg" width ="30%">

<img src="/res/Dynamic_Programming/str3.jpg" width ="30%">



<img src="/res/Dynamic_Programming/str4.jpg" width ="30%">

<img src="/res/Dynamic_Programming/str5.jpg" width ="30%">

<img src="/res/Dynamic_Programming/str6.jpg" width ="30%">

### 2.最长公共子序列应用

- Diff工具

- Git等版本控制工具

- 相似资料搜索

  

### 3.动态规划解法

#### 		1.划分子问题

​				定义序列X={x<sub>1</sub>,x<sub>2</sub>,…,x<sub>i</sub>},Y={Y<sub>1</sub>,Y<sub>2</sub>,…,Y<sub>j</sub>}

​				序列Z为XY的最长公共子序列,Z={Z<sub>1</sub>,Z<sub>2</sub>,Z<sub>2</sub>,…,Z<sub>k</sub>}			

#### 		2.推导

​				Z有三种情况

​				1.X<sub>i</sub>=Y<sub>j</sub>,则Z<sub>k</sub>=X<sub>i</sub>=Y<sub>j</sub>,并且Z<sub>k-1</sub>为X<sub>i-1</sub>与Y<sub>j-1</sub>的最长公共子序列

​				2.X<sub>i</sub>≠Y<sub>j</sub>,则Z<sub>k</sub>,为X<sub>i-1</sub>与Y<sub>j</sub>的最长公共子序列

​				3.X<sub>i</sub>≠Y<sub>j</sub>,则Z<sub>k</sub>,为X<sub>i</sub>与Y<sub>j-1</sub>的最长公共子序列

​				依次类推,可推导出公式：
			
<img src="/res/Dynamic_Programming/lcs1.png" width ="70%">



​			[参考实现](/code/LCS/Main.groovy)

