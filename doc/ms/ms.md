## Maximal Square

#### 题目

Given a 2D binary matrix filled with 0's and 1's, find the largest square containing

all 1's and return its area.

For example, given the following matrix:


1     0     1     0     0

1     0     1     1      1

1     1      1     1      1

1     0     0     1      0


Return 4.


#### 动态规划：

递推公式：dp[i][j] = min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1]) + 1

具体代码：

```java
public class MaximalSquare {

	public int maximalSquare(char[][] matrix) {
        int row = matrix.length;
        if (row == 0) {
            return 0;
        }
        int column = matrix[0].length;
        int[][] dp = new int[row + 1][column + 1];
        int maxSide = 0;
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= column; j++)
                if (matrix[i - 1][j - 1] == '1') {
                    dp[i][j] = Math.min(Math.min(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1]) + 1;
                    maxSide = Math.max(dp[i][j], maxSide);
                }
        }
        return maxSide * maxSide;
    }
}

```

#### 讲解：

我们用 dp(i, j) 表示以 (i, j) 为右下角，且只包含 1 的正方形的边长最大值。

如果我们能计算出所有 dp(i, j) 的值，那么其中的最大值即为矩阵中只包含 1 的正方形的边长最大值，其平方即为最大正方形的面积。



那么如何计算 dp 中的每个元素值呢？对于每个位置 (i, j)，检查在矩阵中该位置的值：

如果该位置的值是 0，则 dp(i, j) = 0，因为当前位置不可能在由 1 组成的正方形中；
如果该位置的值是 1，则 dp(i, j) 的值由其上方、左方和左上方的三个相邻位置的 dp 值决定。具体而言，当前位置的元素值等于三个相邻位置的元素中的最小值加 1 ；


方程如下：

dp(i, j)=min(dp(i−1, j), dp(i−1, j−1), dp(i, j−1))+1


此外，还需要考虑边界条件。如果 i 和 j 中至少有一个为 0，则以位置 (i, j) 为右下角的最大正方形的边长只能是 1，因此 dp(i, j)=1。



 ![](../../res/ms/1.png)
