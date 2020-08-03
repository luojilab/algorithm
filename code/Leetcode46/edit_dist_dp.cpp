#include <vector>
#include <algorithm> 
#include "edit_dist_dp.h"

int editDistDp(const std::string &word1, const std::string &word2) {
    int m = word1.length();
    int n = word2.length();

    // 有一个字符串为空串
    if (m * n == 0){
        return m + n;
    } 

    // DP 数组
    std::vector<std::vector<int> > dp((m + 1),std::vector<int>(n + 1));

    // 边界状态初始化
    for (int i = 0; i < m + 1; i++) {
		dp[i][0] = i;
    }
    for (int j = 0; j < n + 1; j++) {
		dp[0][j] = j;
    }

    // 计算所有 DP 值
	for (int i = 1; i <= m; i++) {
		for (int j = 1; j <= n; j++) {
			if (word1[i - 1] == word2[j - 1]) {
				dp[i][j] = dp[i - 1][j - 1];
			}else {
				dp[i][j] = 1 + std::min(dp[i - 1][j],
					std::min(dp[i][j - 1],
						dp[i - 1][j - 1]));
			}
		}
	}
    return dp[m][n];
}