#include <vector>
#include <algorithm> 
#include "edit_dist_dp_best.h"

int editDistDpBest(const std::string &word1, const std::string &word2){ 
    int m = word1.length(); 
    int n = word2.length(); 

	if (m * n == 0) {
		return m + n;
	}
  
	std::vector<std::vector<int> > dp((2), std::vector<int>(n + 1));
  
	int iSize = dp.size();
	for (int i = 0; i < iSize; i++) {
		int jSize = dp[i].size();
		for (int j = 0; j < jSize; j++) {
			dp[i][j] = 0;
		}
	}

	//初始化i=0的一行值
    for (int i = 0; i <= n; i++){
		dp[0][i] = i;
    }

	for (int i = 1; i <= m; i++) {
		for (int j = 0; j <= n; j++) {
			if (j == 0) {
				dp[i % 2][j] = i;
			}else if (word1[i - 1] == word2[j - 1]) {
				dp[i % 2][j] = dp[(i - 1) % 2][j - 1];
			}else {
				dp[i % 2][j] = 1 + std::min(dp[(i - 1) % 2][j],
					std::min(dp[i % 2][j - 1],
						dp[(i - 1) % 2][j - 1]));
			}
		}
	}
  
    return dp[m % 2][n];
}