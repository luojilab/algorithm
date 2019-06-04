## 排序专题（5）
1. [归并排序](./doc/Sort/Merge_Sort/readme.md)
2. [快速排序](./doc/Sort/Quick_Sort/readme.md)
3. [线性排序](./doc/Sort/Linear_Sort/readme.md)
    1. [计数排序](./doc/Sort/Linear_Sort/readme.md#Couting_Sort)
    2. [基数排序](./doc/Sort/Linear_Sort/readme.md#Radix_Sort)
    3. [桶排序](./doc/Sort/Linear_Sort/readme.md#Bucket_Sort)
4. [红黑树](./doc/Tree/RBTree/readme.md)（平衡二叉树）
5. [B树](./doc/Tree/BTree/readme.md)（平衡二叉树）
## 动态规划专题（6）
6. [动态规划](./doc/Dynamic_Programming/readme.md)（基本概念）
7. 最长公共子序列（动态规划练习题）
8. [最优二叉搜索树](./doc/Dynamic_Programming/optimal_binary_search_tree.md)
9. [0-1背包问题](./doc/Dynamic_Programming/0-1_knapsack_problem.md)
10. 完全背包问题
11. 多重背包问题

## 贪心算法专题（2）
12. 贪心算法
13. 贪心算法与动态规划问题的对比

## 字符串查找算法（4）
14. 朴素字符串匹配算法
15. Rabin-Karp算法
16. 利用有限自动机进行字符串匹配
17. KMP算法图算法

## 图的算法（5）
18. 图的基本概念
19. 单源最短路径
20. Dijkstra算法
21. 所有结点对的最短路径问题
22. 最大流

## 多线程算法（1）
23. 动态多线程基础 + 案例

## Leetcode 算法
24. ***【Add Two Numbers】*** 给两个非空数组单向链表，代表两个非负整数。数字在链表中的存储是逆序的（如，对于123在链表中的存储是3-&gt;2-&gt;1），将两个链表相加输出结果。结果也为链表

```
Input: (2-> 4 -> 3) + (5 -> 6 -> 4)
Output: (7 -> 0 -> 8)
Explanation: 342 + 465 = 807.
```
25. ***【Longest Substring Without Repeating Characters】*** 给定一个字符串，找到最长的没有重复字符的子串. 
26. ***【Longest Palindromic Substring】*** 给定一个字符串，找到最长的回文子串
27. ***【Container With Most Water】*** 给定一个正整数数组，其组成的容器所能容纳的最大面积
```
给定：[1,8,6,2,5,4,8,3,7]
```
![72dd14b3a9a1e9aafab131ca42d2ed1a.png](./res/cover/question_11.jpg)
```
组成的最大面积就是49
```
28. ***【3Sum】*** 给定一个成员数量大于三的数组，找到三个元素a,b,c使a+b+c=0。找出所有可能的情况

29. ***【Search in Rotated Sorted Array】*** Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.```(i.e.[0,1,2,4,5,6,7]might become[4,5,6,7,0,1,2]).```
You are given a target value to search. If found in the array return its index, otherwise return -1.
You may assume no duplicate exists in the array.
Your algorithm's runtime complexity must be in the order of&nbsp;O(logn).

30. ***【[Combination Sum](./doc/Combination_Sum/readme.md)】*** Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.The same repeated number may be chosen from candidates unlimited number of times.
> Note:All numbers (including target) will be positive integers.The solution set must not contain duplicate combinations.

Example:
```
Input :[2,3,6,7], target=7, A solution set is:
[
[7],
[2,2,3]
]
```

31. ***【Permutations】*** 给定一个不同元素的数组，输出所有可能的组合
Example:
```
Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

32. ***【Merge Intervals】*** 给定区间的组合，然后合并相互覆盖的区间。输出结果
    Example:
```
Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
```

33. ***【Unique Paths II】*** A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
Now consider if some obstacles are added to the grids. How many unique paths would there be?
![50ee09bddc06507fc3d53fa1e5986ca6.png](./res/cover/robot_maze.png)
An obstacle and empty space is marked as 1 and 0 respectively in the grid.
> Note: m and n will be at most 100.

Example 1:
```
Input:
[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
Output: 2
Explanation:
There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right
```

34. ***【Minimum Size Subarray Sum】*** Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
Example:
```
Input: s = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: the subarray [4,3] has the minimal length under the problem constraint
```

35. ***【Median of Two Sorted Arrays】*** There are two sorted arrays nums1 and nums2 of size m and n respectively.
Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
You may assume nums1 and nums2 cannot be both empty.

Example 1:
```
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
```
Example 2:
```
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
```

36. ***【First Missing Positive】*** Given an unsorted integer array, find the smallest missing positive integer.

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

>Note:
Your algorithm should run in O(n) time and uses constant extra space.

37. ***【Trapping Rain Water】*** Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

![a0b5725179e8d2e8540134afe72860be.png](./res/cover/rainwatertrap.png)

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

Example:
```
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```

38. N皇后问题
39. 汉诺塔问题
40. ***【Minimum Window Substring】*** Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

Example:
```
Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
```
>Note:
· If there is no such window in S that covers all characters in T, return the empty string "".
· If there is such window, you are guaranteed that there will always be only one unique minimum window in S.

41. 哈夫曼编码算法
42. ***【LRU Cache】*** Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
Follow up:
Could you do both operations in O(1) time complexity?
Example:
```
LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
```

43. ***【Climbing Stairs】*** You are climbing a stair case. It takes n steps to reach to the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
Note: Given n will be a positive integer.
Example 1:
```
Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
```
Example 2:
```
Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

44. ***【Best Time to Buy and Sell Stock】*** Say you have an array for which the ith element is the price of a given stock on day i.
If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
Note that you cannot sell a stock before you buy one.
Example 1:
```
Input: [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.
```
Example 2:
```
Input: [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.
```

45. ***【Single Number III】*** Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
Example:
```
Input:  [1,2,1,3,2,5]
Output: [3,5]
```
> Note:
> 1. The order of the result is not important. So in the above example, [5, 3] is also correct.
> 2. Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?

46. ***【Edit Distance】*** Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
You have the following 3 operations permitted on a word:
    1. Insert a character
    2. Delete a character
    3. Replace a character

Example 1:
```
Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
```
Example 2:
```
Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation: 
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
```

47. ***【Number of Islands】*** Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
Example 1:
```
Input:
11110
11010
11000
00000

Output: 1
```
Example 2:
```
Input:
11000
11000
00100
00011

Output: 3
```

48. ***【Maximal Square】*** Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

Example:
```
Input: 

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0

Output: 4
```

49. ***【Coin Change】*** You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
Example 1:
```
Input: coins = [1, 2, 5], amount = 11
Output: 3 
Explanation: 11 = 5 + 5 + 1
```
Example 2:
```
Input: coins = [2], amount = 3
Output: -1
```

50. ***【Linked List Cycle II】*** Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

> Note: Do not modify the linked list.

Example 1:
```
Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.
```
![0ac1c374da73504066d5990dc7ea7cbb.png](./res/cover/circularlinkedlist.png)

Example 2:
```
Input: head = [1], pos = -1
Output: no cycle
Explanation: There is no cycle in the linked list.
```
![faeeb9031a07904b5fb959efd28ee031.png](./res/cover/circularlinkedlist_test3.png)

> Follow up:
> Can you solve it without using extra space?



51. 【Find the Duplicate Number】Given an array *nums* containing *n* + 1 integers where each integer is between 1 and *n* (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

    **Example 1:**

    ```
    Input: [1,3,4,2,2]
    Output: 2
    ```

    **Example 2:**

    ```
    Input: [3,1,3,4,2]
    Output: 3
    ```

    **Note:**

    1. You **must not** modify the array (assume the array is read only).
    2. You must use only constant, *O*(1) extra space.
    3. Your runtime complexity should be less than *O*(*n*2).
    4. There is only one duplicate number in the array, but it could be repeated more than once.

