### 利用有限自动机进行字符串匹配





# 确定有限状态自动机

在[计算理论](https://www.wikiwand.com/zh-hans/计算理论)中，**确定有限状态自动机**或**确定有限自动机**（英语：deterministic finite automaton, DFA）是一个能实现状态转移的[自动机](https://www.wikiwand.com/zh-hans/自动机)。对于一个给定的属于该自动机的状态和一个属于该自动机字母表![\Sigma ](https://wikimedia.org/api/rest_v1/media/math/render/svg/9e1f558f53cda207614abdf90162266c70bc5c1e)的字符，它都能根据事先给定的转移函数转移到下一个状态（这个状态可以是先前那个状态）。



## 基础概念

### 定义

确定有限状态自动机![{\mathcal {A))](https://wikimedia.org/api/rest_v1/media/math/render/svg/280ae03440942ab348c2ca9b8db6b56ffa9618f8)是由

- 一个非空有限的[状态](https://www.wikiwand.com/zh-hans/状态)集合![Q](https://wikimedia.org/api/rest_v1/media/math/render/svg/8752c7023b4b3286800fe3238271bbca681219ed)
- 一个输入[字母表](https://www.wikiwand.com/zh-hans/字母表_(计算机科学))![\Sigma ](https://wikimedia.org/api/rest_v1/media/math/render/svg/9e1f558f53cda207614abdf90162266c70bc5c1e)（非空有限的字符集合）
- 一个转移[函数](https://www.wikiwand.com/zh-hans/函数)![\delta :Q\times \Sigma \rightarrow Q](https://wikimedia.org/api/rest_v1/media/math/render/svg/bf5e7275cee499c75c2367211364697dee26de11)（例如：![\delta \left(q,\sigma \right)=p,\left(p,q\in Q,\sigma \in \Sigma \right)](https://wikimedia.org/api/rest_v1/media/math/render/svg/0dd107c0cd016f21c8fe2427dd2256bad3e95d24)）
- 一个开始状态![s\in Q](https://wikimedia.org/api/rest_v1/media/math/render/svg/baa662d061d25282ee121464d38bc961522e7219)
- 一个接受状态的集合![F\subseteq Q](https://wikimedia.org/api/rest_v1/media/math/render/svg/9ada8f098adcf02f7a674d2a5f2dda5e4917881e)

所组成的5-[元组](https://www.wikiwand.com/zh-hans/多元组)。因此一个DFA可以写成这样的形式：![{\mathcal  {A))=\left(Q,\Sigma ,\delta ,s,F\right)](https://wikimedia.org/api/rest_v1/media/math/render/svg/668aec9172280d42367d0ed251171b1fdeff7b8d)。

### 工作方式

确定有限状态自动机从起始状态开始，一个字符接一个字符地读入一个字符串![w\in \Sigma ^{*}](https://wikimedia.org/api/rest_v1/media/math/render/svg/8861ae978b1183cafefa37263b531d68ca4df792)（这里的![{}^{*}](https://wikimedia.org/api/rest_v1/media/math/render/svg/002b545cd6a6f230c91717f3321b3288a405f6a4)指示[Kleene星号](https://www.wikiwand.com/zh-hans/Kleene星号)算子。），并根据给定的转移函数一步一步地转移至下一个状态。在读完该字符串后，如果该自动机停在一个属于F的接受状态，那么它就接受该字符串，反之则拒绝该字符串。





![](https://cdncontribute.geeksforgeeks.org/wp-content/uploads/autometa1.png)

上图为模式串 ACACAGA的有限状态机状态转换图

从状态0到状态7，每次输入一个字符，都会让状态机从一个状态转移至另一个状态，直到状态7，说明模式完全匹配，例如，此时处于状态3，如果下一个字符，输入C,则会进入状态4，如果输入字符A，则会进入状态1，依次类推，如果既非A，又非C，则状态变为0





### 状态转移表

所谓的状态机，在数据结构上表现，就是一个表格，即状态转移表，列代表了模式串每个字符，行代表了每个字符在对应位置要进行转移的状态，如下：



![](https://cdncontribute.geeksforgeeks.org/wp-content/uploads/autometa2.png)

上图为模式串 ACACAGA的状态转移表（T代表其他非ACG的字符）



具体怎么样呢，比如，有一个字符串 B A A C C A C A C A C A G A G

依次输入每个字符进入状态机，对应的状态就为

| 字符 | B    | A    | A    | C    | C    | A    | C    | A    | C    | A    | C    | A    | G    | A    | G    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 状态 | 0    | 1    | 1    | 2    | 0    | 1    | 2    | 3    | 4    | 5    | 4    | 5    | 6    | 7    | 0    |

明显，状态7的位置（包括）前7位，就是找到匹配的字符串。



利用生成好的状态机进行字符串匹配，很简单。复杂的是如何生成该状态机









### 思考

##### 定义变量

des[N] 表示目标串，例如ABACAABABAACK，pat[M] 表示模式串，如ABAB, des[i...j] 表示 des[] 中从i到j的子串, pat[i...j]的定义类似，数组下标从1开始

根据有限状态自动机的定义，长度为M的pat[M],状态为分别为0，1，2，，，，，M-2，M-1,M,即共有M+1种状态。

假设模式串中不同的字符个数为 L（即模式串内总共非重复字符种类个数，如ABAB内的A，B，共2个字符）

则状态转移表为table[L] [M+1]



##### 推算

当字符串匹配处于某个状态s后，下一个可能的字符输入ch有L+1种可能。根据确定有限状态机的定义，在某一个状态下，任何一个输入都可以进入下一个确定状态

则此时有三种可能

1.pat[s+1]=ch,则ch下的状态为s+1

2.ch 不属于L种类内，则ch状态为0

3.ch剩余L种类，但是pat[s+1] != ch,则需要求出字符串 pat[1…s]+ch=str 的最长相同前后缀子串pat[1…k]，则k就为ch下的状态



前1，2种很容易理解

关键是情况3，为什么k就为ch的状态



1.假设i为ch的状态，且i>k,那么，pat[1…i]必定为str的前后缀，则与pat[i…k]为str的最长前后缀假设冲突，因为pat[1…i]的长度已经超过pat[1…k]的长度了，假设不成立



2.假设i为ch的状态，且i<k，确实，这样设定没有什么不合理的地方，但是有个问题，当下一个输入ch+1与pat[k+1]匹配时，可能i会漏掉这种可能，因为ch+1可能与pat[i+1]字符不同，但是如果此时i=k,则不会漏掉这种情况。因此，这里也不能采用



综合1，2，就需要求出str的最长相同前后缀子串pat[1…k]，k作为ch下的状态



利用这三种情况，自动机字符串匹配代码实现代码如下[源码](/code/FSM/Main.java)





























