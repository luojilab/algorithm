## Quick Sort

### 算法思想

快速排序算法采用经典的分治策略，是对冒泡排序算法（交换排序）的一种改进。

### 基本思路
通过一次排序将要排序的数据分割成独立的两部分，使得其中一部分的所有数据大于 value，另外一部分的所有数据小于 value。  
然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。

#### 普通快排
1. 判断参数的有效性，也就是递归的出口;
2. 随机选取一个 value 作为被比较对象;
3. 依次将传入的数组中的元素与 value 做对比，使得 arr[l + 1 ... p - 1] < value、arr[p + 1 ... r] >= value，并返回 p 索引;
4. 递归排序 arr[l ... p - 1] 与 arr[p + 1 ... r] 直到结束;

##### 排序具体步骤
1. 选取 arr[l] 为被比较的 value，从左到右遍历;
2. arr[i] > value、i++;
3. arr[i] < value、arr[i] 与 arr[p] 交换、p++、i++;
4. 最后交换 arr[l] 与 arr[p] ，并返回 p 即可;

![Tree](../../../res/Sort/Quick_Sort/QuickSort.jpg)      

<br></br>
#### 双路快排
1. 判断参数的有效性，也就是递归的出口;
2. 随机选取一个 value 作为被比较对象;
3. 依次将传入的数组中的元素与 value 做对比，使得 arr[l + 1 ... i - 1] <= value、arr[j + 1 ... r] >= value ，返回 j 索引;
4. 递归排序 arr[l ... j - 1] 与 arr[j + 1 ... r] 直到结束;

##### 排序具体步骤
1. 选取 arr[l] 为被比较的 value;
2. 从左到右循环比较 arr[i] 与 value，如果 arr[i] < value 则 i++，直至 arr[i] >= value;
3. 从右到左循环比较 arr[j] 与 value，如果 arr[j] > value 则 j--，直至 arr[j] <= value;
4. 如果 i > j，则结束循环。否则，交换 arr[i] 与 arr[j]（此时、即使 arr[i] == arr[j] == value，也会交换），i++、j--;
5. 最后交换 arr[l] 与 arr[j]，并返回 j 即可;

![Tree](../../../res/Sort/Quick_Sort/QuickSort2Way.jpg)   

<br></br>
#### 三路快排
1. 判断参数的有效性，也就是递归的出口;
2. 随机选取一个 value 作为被比较对象;
3. 依次将传入的数组中的元素与 value 做对比，使得 arr[l + 1 ... lt] < value、arr[lt + 1 ... gt - 1] == value、arr[gt ... r] > value;
4. 递归排序 arr[l ... lt] 与 arr[gt ... r] 直到结束；

##### 排序具体步骤
1. 选取 arr[l] 为被比较的 value;
2. 循环比较 arr[i] 与 value，当 i 与 gt 重合时则退出循环;
3. arr[i] == value、i++;
4. arr[i] < value、arr[i] 与 arr[lt + 1] 交换、i++、lt++;
5. arr[i] > value、arr[i] 与 arr[gt - 1] 交换、gt--;
6. 最后交换 arr[l] 与 arr[lt]、lt--;

![Tree](../../../res/Sort/Quick_Sort/QuickSort3Way.jpg)  

<br></br>
### 时间复杂度

最优情况下，每次 Partiation 都划分得很均匀，如果排序n个关键字，其递归树的深度就为 [log2n] + 1，即仅需递归 log2n 次;
需要时间为 T(n) 的话，第一次 Partiation 应该是需要对整个数组扫描一遍，做 n 次比较;然后，获得的枢轴将数组一分为二，那么各自还需要 T(n/2) 的时间（注意是最好情况，所以近似于平分两半）;于是不断地划分下去。。。
```
公式：T[n]  =  nT(1) + (log(n)) * n；

推导过程：
T(n) = 2T(n/2) + n
T(n) = 2(2T(n/4) + n/2) + n = 4T(n/4) + 2n
T(n) = 4(2T(n/8) + n/4) + 2n = 8T(n/8) + 3n
......
且 T(1) = 0

结果：T[n] = O(nlogn)
```

最差情况下，当待排序的序列为正序或逆序排列时，且每次划分只得到一个比上一次划分少一个记录的子序列，注意另一个为空。如果递归树画出来，它就是一棵斜树；此时需要执行 n ‐ 1 次递归调用，且第 i 次划分需要经过 n ‐ i 次关键字的比较才能找到第 i 个记录，也就是枢轴的位置。
```
公式：T[n]  = n - 1 + n - 2 +  ...... + 1 = n * (n - 1) / 2 = O(n^2)
```
