***【Edit Distance】*** Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
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

***【编辑距离】*** 给定两个单词 word1 和 word2, 找出最少的操作步骤数使单词 word1 转换成 word2.
你有下面三种操作限制在一个单词上:

       1. 插入一个字符
       2. 删除一个字符
       3. 替换一个字符

**解法1：暴力方式**

罗列所有可能

从两个字符串的左侧或右侧逐一处理所有字符。

让我们从右上角遍历，每次遍历有两种可能性。

m：字符串1的长度

n：字符串2的长度

![](..\..\res\Leetcode46\EditDistance11.png)

1.如果两个字符串的最后一个字符相同，则什么也不做。 忽略最后一个字符并获得剩余字符串的计数。 因此，我们递归长度为m-1和n-1。

2.否则（如果最后一个字符不同），我们考虑对字符串1的所有操作，对字符串1的最后一个字符有三个操作，递归计算这三个操作的最低成本，并取三个值中的最小值。

插入
删除
替换

**代码：**

```
int editDist(string word1 , string word2, int m, int n) { 
    // If first string is empty, the only option is to 
    // insert all characters of second string into first 
    if (m == 0){
        return n;
    }		
  
    // If second string is empty, the only option is to 
    // remove all characters of first string 
    if (n == 0){ 
        return m; 
    }
    // If last characters of two strings are same, nothing 
    // much to do. Ignore last characters and get count for 
    // remaining strings. 
    if (word1[m - 1] == word2[n - 1]) {
        return editDist(word1, word2, m - 1, n - 1); 
    }
    // If last characters are not same, consider all three 
    // operations on last character of first string, recursively 
    // compute minimum cost for all three operations and take 
    // minimum of three values. 
    return 1 + min(editDist(word1, word2, m, n - 1), // Insert 
                   editDist(word1, word2, m - 1, n), // Remove 
                   editDist(word1, word2, m - 1, n - 1) // Replace 
                   ); 
}
```

**复杂度分析**

上述解决方案的时间复杂度是指数的。 在最坏的情况下，我们可能最终会执行O（3<sup>m</sup>）操作，假设m>n，如果m < n就是O（3<sup>n</sup>）。 如果两个字符串的字符都不匹配，则会发生最坏的情况。 下面是最坏情况的递归调用图。

![](..\..\res\Leetcode46\EditDistance1.png)

我们可以看到，许多子问题都被重复的解决，例如，eD（2，2）被调用了三次。 由于再次调用了相同的问题，因此此问题具有“重叠子问题”属性。 因此，动态规划问题需要有两个属性（重叠子问题属性、最优子结构属性）。最优子结构属性是什么？“编辑距离”问题的最优子结构就是当字符串1的字符扫描到0个字符和字符串2字符扫描到0个字符就是最优的子结构，所以像其他典型的动态编程（DP）问题一样，可以通过构造一个存储子问题结果的临时数组来避免相同子问题的重新计算。

**解法2：动态规划**

假设给定了两个单词，设为 A 和 B，这样我们就能够六种操作方法。
对单词 A 删除一个字符和对单词 B 插入一个字符是等价的。例如当单词 A 为 doge，单词 B 为 dog 时，我们既可以删除单词 A 的最后一个字符 e，得到相同的 dog，也可以在单词 B 末尾添加一个字符 e，得到相同的 doge；
同理，对单词 B 删除一个字符和对单词 A 插入一个字符也是等价的；
对单词 A 替换一个字符和对单词 B 替换一个字符是等价的。例如当单词 A 为 bat，单词 B 为 cat 时，我们修改单词 A 的第一个字母 b -> c，和修改单词 B 的第一个字母 c -> b 是等价的。

这样以来，本质不同的操作实际上只有三种：
在单词 A 中插入一个字符；
在单词 A 中删除一个字符；
在单词 A 中替换一个字符；

这样以来，我们就可以把原问题转化为规模较小的子问题。我们用 A = horse，B = ros 作为例子，来看一看是如何把这个问题转化为规模较小的若干子问题的。

在单词 A 中插入一个字符：如果我们知道 horse 到 ro 的编辑距离为 a，那么显然 horse 到 ros 的编辑距离不会超过 a + 1。这是因为我们可以在 a 次操作后将 horse 变为 ros ，只需要额外的 1 次操作，在单词 A 的末尾添加字符 s，就能在 a + 1 次操作后将 horse变为ros；
在单词 A 中删除一个字符：如果我们知道 hors 到 ros 的编辑距离为 b，那么显然 horse 到 ros 的编辑距离不会超过 b + 1，原因同上；
替换单词 A 的一个字符：如果我们知道 hors 到 ro 的编辑距离为 c，那么显然 horse 到 ros 的编辑距离不会超过 c + 1，原因同上。

那么从 horse 变成 ros 的编辑距离应该为 min(a + 1, b + 1, c + 1)。

**注意：**为什么我们总是在单词 A 和 B 的末尾插入或者修改字符，能不能在其它的地方进行操作呢？答案是可以的，但是我们知道，操作的顺序是不影响最终的结果的。例如对于单词 cat，我们希望在 c 和 a 之间添加字符 d 并且将字符 t 修改为字符 b，那么这两个操作无论为什么顺序，都会得到最终的结果 cdab。

你可能觉得 horse 到 ro 这个问题也很难解决。但是没关系，我们可以继续用上面的方法拆分这个问题，对于这个问题拆分出来的所有子问题，我们也可以继续拆分，直到：
字符串 A 为空，如从空字符串转换到 ro，显然编辑距离为字符串 B 的长度，这里是 2；
字符串 B 为空，如从 horse 转换到空字符串，显然编辑距离为字符串 A 的长度，这里是 5。
因此，我们就可以使用动态规划来解决这个问题了。我们用 D [i] [j] 表示A的前i个字母和B的前j个字母之间的编辑距离。
如上所述，当我们获得 D [i] [j-1]，D [i-1] [j] 和 D [i-1] [j-1] 的值之后就可以计算出 D [i] [j]。

D [i] [j-1] 为 A 的前 i 个字符和 B 的前 j - 1 个字符编辑距离的子问题。即对于 A 的前 i 个字符和 B 的前 j 个字符的编辑距离，我们在 A 的末尾添加了一个相同的字符，那么 D [i] [j] 最小可以为 D [i] [j-1] + 1；

D [i-1] [j] 为 A 的前 i - 1 个字符和 B 的前 j 个字符编辑距离的子问题。即对于 A 的前 i 个字符和 B 的前 j 个字符的编辑距离，我们在 A的i-1的末尾添加了一个相同的字符，那么 D [i] [j] 最小可以为 D [i-1] [j] + 1；

D [i-1] [j-1] 为 A 前 i - 1 个字符和 B 的前 j - 1 个字符编辑距离的子问题。即对于 B 的第 j 个字符，我们修改 A 的第 i 个字符使它们相同，那么 D [i] [j] 最小可以为 D [i-1] [j-1] + 1。特别地，如果 A 的第 i 个字符和 B 的第 j 个字符原本就相同，那么我们实际上不需要进行修改操作。在这种情况下，D [i] [j] 最小可以为 D [i-1] [j-1]。

那么我们可以写出如下的状态转移方程：
若 A 和 B 的最后一个字母相同：
$$
\begin{aligned} D[i][j] &= \min(D[i][j - 1] + 1, D[i - 1][j]+1, D[i - 1][j - 1])\\ &= 1 + \min(D[i][j - 1], D[i - 1][j], D[i - 1][j - 1] - 1) \end{aligned}
$$
若 A 和 B 的最后一个字母不同：
$$
D[i][j]=1+min(D[i][j−1],D[i−1][j],D[i−1][j−1])
$$
综上我们得到了算法的全部流程。



代码：

```
 int editDist(string word1, string word2) {
    int m = word1.length();
    int n = word2.length();

    // 有一个字符串为空串
    if (m * n == 0){
        return m + n;
    } 

    // DP 数组
    int dp[m + 1][n + 1];

    // 边界状态初始化
    for (int i = 0; i < m + 1; i++) {
        dp[i][0] = i;
    }
    for (int j = 0; j < n + 1; j++) {
        dp[0][j] = j;
    }

    // 计算所有 DP 值
    for (int i = 1; i < m + 1; i++) {
        for (int j = 1; j < n + 1; j++) {
            int left = dp[i - 1][j] + 1;
            int down = dp[i][j - 1] + 1;
            int leftDown = dp[i - 1][j - 1];
            if (word1[i - 1] != word2[j - 1]){
                leftDown += 1;
            } 
            dp[i][j] = min(left, min(down, leftDown));
        }
    }
    return dp[m][n];
}
```

**复杂度分析**
时间复杂度 ：O(mn)，其中 m 为 word1 的长度，n 为 word2 的长度。
空间复杂度 ：O(mn)，我们需要大小为 O(mn) 的 D 数组来记录状态值。

**空间复杂度优化**

![](..\..\res\Leetcode46\EditDistance2.png)

![](..\..\res\Leetcode46\EditDistance3.png)

![](..\..\res\Leetcode46\EditDistance4.png)

![](..\..\res\Leetcode46\EditDistance5.png)

![](..\..\res\Leetcode46\EditDistance6.png)

![](..\..\res\Leetcode46\EditDistance7.png)

![](..\..\res\Leetcode46\EditDistance8.png)

![](..\..\res\Leetcode46\EditDistance9.png)

![](..\..\res\Leetcode46\EditDistance10.png)

```
int editDist(string word1, string word2) { 
    int m = word1.length(); 
    int n = word2.length(); 
  
    // Create a DP array to memoize result 
    // of previous computations 
    int dp[2][m + 1]; 
  
    // To fill the DP array with 0 
    memset(dp, 0, sizeof dp); 
  
    // Base condition when second string 
    // is empty then we remove all characters 
    for (int i = 0; i <= m; i++){
        dp[0][i] = i; 
    }
    // Start filling the DP 
    // This loop run for every 
    // character in second string 
    for (int i = 1; i <= n; i++) { 
        // This loop compares the char from 
        // second string with first string 
        // characters 
        for (int j = 0; j <= m; j++) { 
            // if first string is empty then 
            // we have to perform add character 
            // operation to get second string 
            if (j == 0){
                dp[i % 2][j] = i; 
            }  
            // if character from both string 
            // is same then we do not perform any 
            // operation . here i % 2 is for bound 
            // the row number. 
            else if (word1[j - 1] == word2[i - 1]) { 
                dp[i % 2][j] = dp[(i - 1) % 2][j - 1]; 
            } 
  
            // if character from both string is 
            // not same then we take the minimum 
            // from three specified operation 
            else { 
                dp[i % 2][j] = 1 + min(dp[(i - 1) % 2][j], 
                                       min(dp[i % 2][j - 1], 
                                           dp[(i - 1) % 2][j - 1])); 
            } 
        } 
    } 
  
    // after complete fill the DP array 
    // if the len2 is even then we end 
    // up in the 0th row else we end up 
    // in the 1th row so we take len2 % 2 
    // to get row 
    return dp[n % 2][m]; 
}
```

**复杂度分析**
时间复杂度 ：O(mn)，其中 m 为 word1 的长度，n 为 word2 的长度。
空间复杂度 ：O(m)。

**应用**

编辑距离算法被数据科学广泛应用，是用作机器翻译和语音识别评价标准的基本算法。