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
7. [最长公共子序列](./doc/Dynamic_Programming/lcs.md)（动态规划练习题）
8. [最优二叉搜索树](./doc/Dynamic_Programming/optimal_binary_search_tree.md)
9. [0-1背包问题](./doc/Dynamic_Programming/0-1_knapsack_problem.md)
10. [完全背包问题](./doc/Dynamic_Programming/complete_knapsack_problem.md)
11. [多重背包问题](./doc/Dynamic_Programming/multiple_knapsack_problem.md)

## 贪心算法专题（2）
12. [贪心算法](./doc/GreedyAlgorithm/greedy_algorithms.md)
13. [贪心算法与动态规划问题的对比](./doc/Dynamic_Programming/summary.md)

## 字符串查找算法（4）
14. [朴素字符串匹配算法](./doc/String/naive-string-matching-algorithm/BF.md)
15. [Rabin-Karp算法](./doc/String/Rabin-Karp/ReadMe.md)
16. [利用有限自动机进行字符串匹配](./doc/String/fsm/fsm.md)
17. [KMP算法图算法](./doc/KMP/readme.md)

## 图的算法（5）
18. [图的基本概念](./doc/Graph/Basic/Concept.md)
19. [单源最短路径](./doc/Drawable/DrawableShortPath.md)
20. [Dijkstra算法](./doc/Graph/Dijkstra/Dijkstra算法.md)
21. [所有结点对的最短路径问题](./doc/Graph/Floyd-Warshall/Floyd-Warshall.md)
22. [最大流](./doc/Graph/MaximumFlow/MaximumFlow.md)

## 多线程算法（1）
23. [动态多线程基础 + 案例](./doc/Multithreading/动态多线程算法.md)

## Leetcode 算法
24. [***【Remove Nth Node From End of List】***](./doc/Leetcode24/leetcode-24.md)  Given a linked list, remove the n-th node from the end of list and return its head.

Example:
```
		Given linked list: 1->2->3->4->5, and n = 2.

		After removing the second node from the end, the linked list becomes 1->2->3->5.
```
Note:
```
	Given n will always be valid.
```

Follow up:
```
	Could you do this in one pass?
```
25. ***[【Longest Substring Without Repeating Characters】](./doc/Leetcode25/leetcode-25.md)*** 给定一个字符串，找到最长的没有重复字符的子串. 
26. [***【Longest Palindromic Substring】***](./doc/Leetcode26/Leetcode26.md) 给定一个字符串，找到最长的回文子串
27. [***【Container With Most Water】***](./doc/Container/ContainerWithMostWater.md) 给定一个正整数数组，其组成的容器所能容纳的最大面积
```
给定：[1,8,6,2,5,4,8,3,7]
```
![72dd14b3a9a1e9aafab131ca42d2ed1a.png](./res/cover/question_11.jpg)
```
组成的最大面积就是49
```
28. *** 【[3Sum](./doc/3sum/3sum.md)】 *** 给定一个成员数量大于三的数组，找到三个元素a,b,c使a+b+c=0。找出所有可能的情况

29. ***【[Search in Rotated Sorted Array](./doc/SearchinRotatedSortedArray/search_in_rotated_sorted_array.md)】*** Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.```(i.e.[0,1,2,4,5,6,7]might become[4,5,6,7,0,1,2]).```
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

31. ***【[Permutations II](./doc/Leetcode47/readme.md)】*** Given a collection of numbers that might contain duplicates, return all possible unique permutations.
Example:
```
		Input: [1,1,2]
		Output:
		[
		  [1,1,2],
		  [1,2,1],
		  [2,1,1]
		]
```

32. ***【[Merge Intervals](./doc/Leetcode56/readme.md)】*** 给定区间的组合，然后合并相互覆盖的区间。输出结果
    Example:
```
Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
```

33. ***[【Unique Paths II】](./doc/UniquePathsII/UniquePathsII.md)*** A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
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

34. ***[【Minimum Size Subarray Sum】](./doc/Leetcode209/leetcode-209.md)*** Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
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

43. ***【Longest Valid Parentheses】*** Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
Note: Given n will be a positive integer.
Example 1:
```	
	Input: "(()"
	Output: 2
	Explanation: The longest valid parentheses substring is "()"
```
Example 2:
```
	Input: ")()())"
	Output: 4
	Explanation: The longest valid parentheses substring is "()()"
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

49. ***【Word Search II】***  Given a 2D board and a list of words from the dictionary, find all words in the board.
	

Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or 	vertically neighboring. The same letter cell may not be used more than once in a word.

Example 1:
```
Input: 
	board = [
	  ['o','a','a','n'],
	  ['e','t','a','e'],
	  ['i','h','k','r'],
	  ['i','f','l','v']
	]
words = ["oath","pea","eat","rain"]
	
Output: ["eat","oath"]
```
Note:
```
All inputs are consist of lowercase letters a-z.
The values of words are distinct.
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



51. 【**Find the Duplicate Number**】Given an array *nums* containing *n* + 1 integers where each integer is between 1 and *n* (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

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

52. 【**Jump Game II**】Given an array of non-negative integers, you are initially positioned at the first index of the array.
Each element in the array represents your maximum jump length at that position.
Your goal is to reach the last index in the minimum number of jumps.

Example:
```
Input: [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2.
    Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

Note:
```
You can assume that you can always reach the last index.
```

## 哈希算法专题
53. Cyclic redundancy checks
54. cryptographic hash functions：mdX
55. cryptographic hash functions：SHA-X

## 加密算法专题
56. AES
57. RSA

## Leetcode 算法

58. **[【Candy】](./doc/Leetcode58/Leetcode58.md)** There are N children standing in a line. Each child is assigned a rating value.

    You are giving candies to these children subjected to the following requirements:

    Each child must have at least one candy.
    Children with a higher rating get more candies than their neighbors.
    What is the minimum candies you must give?
    
    ```
    Example 1:
    
    Input: [1,0,2]
    Output: 5
    Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
    Example 2:
    
    Input: [1,2,2]
    Output: 4
    Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively. The third child gets 1 candy because it satisfies the above two conditions.
    ```
    
    

59. **【Find Peak Element】** A peak element is an element that is greater than its neighbors.

    Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

    The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

    You may imagine that nums[-1] = nums[n] = -∞.

    ```
    Example 1:
    
    Input: nums = [1,2,3,1]
    Output: 2
    Explanation: 3 is a peak element and your function should return the index number 2.
    Example 2:
    
    Input: nums = [1,2,1,3,5,6,4]
    Output: 1 or 5 
    Explanation: Your function can return either index number 1 where the peak element is 2, 
                 or index number 5 where the peak element is 6.
    ```

    > Note:
    >
    > Your solution should be in logarithmic complexity.

60. **【House Robber II】** You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

    Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

    ```
    Example 1:
    
    Input: [2,3,2]
    Output: 3
    Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
                 because they are adjacent houses.
    Example 2:
    
    Input: [1,2,3,1]
    Output: 4
    Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
                 Total amount you can rob = 1 + 3 = 4.
    ```


61. **[【Min Stack】](./doc/Leetcode155/Leetcode155.md)** Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

    - push(x) -- Push element x onto stack.
    - pop() -- Removes the element on top of the stack.
    - top() -- Get the top element.
    - getMin() -- Retrieve the minimum element in the stack.

    **Example:**

    ```
    MinStack minStack = new MinStack();
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    minStack.getMin();   --> Returns -3.
    minStack.pop();
    minStack.top();      --> Returns 0.
    minStack.getMin();   --> Returns -2.
    ```
    
62. **[【Cat and Mouse】](./doc/CatAndMouse/CatAndMouse.md)** A game on an **undirected** graph is played by two players, Mouse and Cat, who alternate turns.

    The graph is given as follows: `graph[a]` is a list of all nodes `b` such that `ab` is an edge of the graph.

    Mouse starts at node 1 and goes first, Cat starts at node 2 and goes second, and there is a Hole at node 0.

    During each player's turn, they **must** travel along one edge of the graph that meets where they are. For example, if the Mouse is at node `1`, it **must** travel to any node in `graph[1]`.

    Additionally, it is not allowed for the Cat to travel to the Hole (node 0.)

    Then, the game can end in 3 ways:

    - If ever the Cat occupies the same node as the Mouse, the Cat wins.
    - If ever the Mouse reaches the Hole, the Mouse wins.
    - If ever a position is repeated (ie. the players are in the same position as a previous turn, and it is the same player's turn to move), the game is a draw.

    Given a `graph`, and assuming both players play optimally, return `1` if the game is won by Mouse, `2` if the game is won by Cat, and `0` if the game is a draw.

    **Example 1:**

    ```
    Input: [[2,5],[3],[0,4,5],[1,4,5],[2,3],[0,2,3]]
    Output: 0
    Explanation:
    4---3---1
    |   |
    2---5
     \ /
      0
    ```

    



> 本算法目录中Leetcode章节中的算法来自[leetcode](https://leetcode-cn.com/)。请勿商业使用！

