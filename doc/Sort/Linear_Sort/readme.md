## Linear Sort

> 线性排序是一类时间复杂度是线性(O(n))的，主要有计数排序、基数排序、桶排序三种。之所以这三种排序能做到线性的时间复杂度，是因为这三个算法是非基于比较的排序算法，都不涉及元素之间的比较操作。下面我们正式来了解一下这三个算法。

## <A id="Couting_Sort">计数排序 (Couting Sort)</A>

> 计数排序是一个非基于比较的排序算法，该算法于1954年由 Harold H. Seward 提出。它的优势在于在对一定范围内的整数排序时，它的复杂度为Ο(n+k)（其中k是整数的范围），快于任何比较排序算法。 [1-2]  当然这是一种牺牲空间换取时间的做法，而且当O(k)>O(n * log(n))的时候其效率反而不如基于比较的排序（基于比较的排序的时间复杂度在理论上的下限是O(n * log(n)), 如归并排序，堆排序）

### 算法思想

计数排序对输入的数据有附加的限制条件：

1、输入的线性表的元素属于有限偏序集S；

2、设输入的线性表的长度为n，|S|=k（表示集合S中元素的总数目为k），则k=O(n)。

在这两个条件下，计数排序的复杂性为O(n)。

计数排序的基本思想是对于给定的输入序列中的每一个元素x，确定该序列中值小于x的元素的个数（此处并非比较各元素的大小，而是通过对元素值的计数和计数值的累加来确定）。一旦有了这个信息，就可以将x直接存放到最终的输出序列的正确位置上。例如，如果输入序列中只有17个元素的值小于x的值，则x可以直接存放在输出序列的第18个位置上。当然，如果有多个元素具有相同的值时，我们不能将这些元素放在输出序列的同一个位置上，因此，上述方案还要作适当的修改。

### 基本步骤

假设输入的线性表L的长度为n，L=L1,L2,..,Ln；线性表的元素属于有限偏序集S，|S|=k且k=O(n)，S={S1,S2,..Sk}；则计数排序可以描述如下：

1、扫描整个集合S，对每一个Si∈S，找到在线性表L中小于等于Si的元素的个数T(Si)；

2、扫描整个线性表L，对L中的每一个元素Li，将Li放在输出线性表的第T(Li)个位置上，并将T(Li)减1。


![Tree](../../../res/Sort/Linear_Sort/CountSort.mov)

## <A id="Radix_Sort">基数排序 (Radix Sort)</A>

>基数排序（radix sort）属于“分配式排序”（distribution sort），又称“桶子法”（bucket sort）或bin sort，顾名思义，它是透过键值的部份资讯，将要排序的元素分配至某些“桶”中，藉以达到排序的作用，基数排序法是属于稳定性的排序，其时间复杂度为O (nlog(r)m)，其中r为所采取的基数，而m为堆数，在某些时候，基数排序法的效率高于其它的稳定性排序法。

### 算法思想

基数排序的发明可以追溯到1887年赫尔曼·何乐礼在打孔卡片制表机(Tabulation Machine)上的贡献。它是这样实现的：将所有待比较数值（正整数）统一为同样的数位长度，数位较短的数前面补零。然后，从最低位开始，依次进行一次排序。这样从最低位排序一直到最高位排序完成以后, 数列就变成一个有序序列。

基数排序的方式可以采用LSD（Least significant digital）或MSD（Most significant digital），LSD的排序方式由键值的最右边开始，而MSD则相反，由键值的最左边开始。

### 基本步骤

#### 第一步

以LSD为例，假设原来有一串数值如下所示：

73, 22, 93, 43, 55, 14, 28, 65, 39, 81

首先根据个位数的数值，在走访数值时将它们分配至编号0到9的桶子中：
0

1 81

2 22

3 73 93 43

4 14

5 55 65

6

7

8 28

9 39

#### 第二步
接下来将这些桶子中的数值重新串接起来，成为以下的数列：

81, 22, 73, 93, 43, 14, 55, 65, 28, 39

接着再进行一次分配，这次是根据十位数来分配：
0

1 14

2 22 28

3 39

4 43

5 55

6 65

7 73

8 81

9 93

#### 第三步

接下来将这些桶子中的数值重新串接起来，成为以下的数列：

14, 22, 28, 39, 43, 55, 65, 73, 81, 93

这时候整个数列已经排序完毕；如果排序的对象有三位数以上，则持续进行以上的动作直至最高位数为止。


![Tree](../../../res/Sort/Linear_Sort/RadixSort.mov)

## <A id="Bucket_Sort">桶排序 (Bucket Sort)</A>

> 桶排序 (Bucket sort)或所谓的箱排序，是一个排序算法，工作的原理是将数组分到有限数量的桶子里。每个桶子再个别排序（有可能再使用别的排序算法或是以递归方式继续使用桶排序进行排序）。桶排序是鸽巢排序的一种归纳结果。当要被排序的数组内的数值是均匀分配的时候，桶排序使用线性时间（Θ（n））。但桶排序并不是 比较排序，他不受到 O(n log n) 下限的影响。

### 算法思想

首先遍历一遍数组，找出数组中值最大的元素，假设最大的元素为Max；然后定义Max+1个“桶”，可以用“队列”或“栈”来定义；之后再遍历一遍数组，将元素值为i的元素放在第i个桶中；最后从第0个桶开始遍历，将桶中的元素依次放入原有数组中，直到遍历到第Max个桶为止。

由此可见，桶排序目的是以扩大内存空间为代价，从而减少时间复杂度。但是假若数组中的元素很少，而数组中值最大的元素非常大的时候，用这种算法显然也不能减少时间复杂度，故实际中很少用到这种排序算法。此外，对于浮点型的数据，这种算法就非常不适合，除非找到桶的下标（因为桶的下标为整型）与数值精度的映射关系。

### 基本步骤

1、根据待排序集合中最大元素和最小元素的差值范围和映射规则，确定申请的桶个数；

2、遍历待排序集合，将每一个元素移动到对应的桶中；

3、对每一个桶中元素进行排序，并移动到已排序集合中。


![Tree](../../../res/Sort/Linear_Sort/BucketSort.mov)
