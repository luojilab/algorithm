## 题目描述

**【First Missing Positive】** Given an unsorted integer array, find the smallest missing positive integer.

 翻译： 在一个未排序的数组中，寻找第一个缺失的正整数

Example 1:

```
Input: [1,2,0]
Output: 3
```

Example 2:

```
Input: [3,4,-1,1]
Output: 2
```

Example 3:

```
Input: [7,8,9,11,12]
Output: 1
```

> Note: Your algorithm should run in O(n) time and uses constant extra space.
>
> 你的算法的时间复杂度应为O(*n*)，并且只能使用常数级别的空间。



## 解法一：将数组视为哈希表

- 由于题目要求我们“只能使用常数级别的空间”，而要找的数一定在` [1, N + 1]` 左闭右闭（这里 N 是数组的长度）这个区间里。因此，我们可以就把原始的数组当做哈希表来使用。事实上，哈希表其实本身也是一个数组；
- 我们要找的数就在` [1, N + 1]` 里，最后 `N + 1`这个元素我们不用找。因为在前面的 `N` 个元素都找不到的情况下，我们才返回` N + 1`；
- 那么，我们可以采取这样的思路：就把 **1** 这个数放到下标为 **0** 的位置， **2** 这个数放到下标为 **1** 的位置，按照这种思路整理一遍数组。然后我们再遍历一次数组，第 **1** 个遇到的它的值不等于下标的那个数，就是我们要找的缺失的第一个正数。
- first
- 这个思想就相当于**我们自己编写哈希函数**，这个哈希函数的规则特别简单，那就是数值为` i` 的数映射到下标为` i - 1` 的位置。



![图(1)](https://pic.leetcode-cn.com/2d0532fcc0d3da710572c501193ac587e764df660d036eba99d0609b0467f839-0041-14.png''图片title'')

## 参考代码

```java
public class Solution {
    public int firstMissingPositive(int[] nums) {
        int len = nums.length;

        for (int i = 0; i < len; i++) {
            while (nums[i] > 0 && nums[i] <= len && nums[nums[i] - 1] != nums[i]) {
                // 满足在指定范围内、并且没有放在正确的位置上，才交换
                // 例如：数值 3 应该放在索引 2 的位置上
                swap(nums, nums[i] - 1, i);
            }
        }

        // [1, -1, 3, 4]
        for (int i = 0; i < len; i++) {
            if (nums[i] != i + 1) {
                return i + 1;
            }
        }
        // 都正确则返回数组长度 + 1
        return len + 1;
    }

    private void swap(int[] nums, int index1, int index2) {
        int temp = nums[index1];
        nums[index1] = nums[index2];
        nums[index2] = temp;
    }
}
```


## 复杂度分析

时间复杂度：O(N)O(N)，这里 **N** 是数组的长度。

说明：while 循环不会每一次都把数组里面的所有元素都看一遍。如果有一些元素在这一次的循环中被交换到了它们应该在的位置，那么在后续的遍历中，由于它们已经在正确的位置上了，代码再执行到它们的时候，就会被跳过。

最极端的一种情况是，在第 1 个位置经过这个 while 就把所有的元素都看了一遍，这个所有的元素都被放置在它们应该在的位置，那么 for 循环后面的部分的 while 的循环体都不会被执行。

平均下来，每个数只需要看一次就可以了，while 循环体被执行很多次的情况不会每次都发生。这样的复杂度分析的方法叫做均摊复杂度分析。

空间复杂度：O(1)O(1)。


参考：https://leetcode-cn.com/problems/first-missing-positive/solution/tong-pai-xu-python-dai-ma-by-liweiwei1419/




## 解法二：骚解法

**数据预处理**

首先我们可以不考虑负数和零，因为不需要考虑。同样可以不考虑大于 n 的数字，因为首次缺失的正数一定小于或等于 `n + 1` 。缺失的正数为 `n + 1` 的情况会单独考虑。

为了不考虑这些数，又要保证时间复杂度为 **O(N)**，因此不能将这些元素弹出。我们可以将这些数用` 1 `替换。

**使用数组索引作为哈希键 以及 数组元素的符号作为哈希值来实现是否存在的检测**



![图片2](/Users/Sanji/Desktop/111.png)



## 参考代码


```java
class Solution {

  public int firstMissingPositive(int[] nums) {
      int n = nums.length;
      // 基本情况
      int contains = 0;
      for (int i = 0; i < n; i++)
        if (nums[i] == 1) {
          contains++;
          break;
        }

      if (contains == 0)
        return 1;

      if (n == 1)
        return 2;

      // 用 1 替换负数，0， 和大于 n 的数, 转换后，nums 只会包含正数
      for (int i = 0; i < n; i++)
        if ((nums[i] <= 0) || (nums[i] > n))
          nums[i] = 1;

      // 使用索引和数字符号作为检查器
      // 例如，如果 nums[1] 是负数表示在数组中出现了数字 `1`
      // 如果 nums[2] 是正数 表示数字 2 没有出现
      for (int i = 0; i < n; i++) {
        int a = Math.abs(nums[i]);
        // 如果发现了一个数字 a - 改变第 a 个元素的符号
        // 注意重复元素只需操作一次
        if (a == n)
          nums[0] = - Math.abs(nums[0]);
        else
          nums[a] = - Math.abs(nums[a]);
      }

      // 现在第一个正数的下标, 就是第一个缺失的数
      for (int i = 1; i < n; i++) {
        if (nums[i] > 0)
          return i;
      }

      if (nums[0] > 0)
        return n;

      return n + 1;
    }
}
```
  

## 复杂度分析

- 时间复杂度： **O(N)** 由于所有的操作一共只会遍历长度为 `N` 的数组 4 次。
- 空间复杂度： **O(1)** 由于只使用了常数的空间。