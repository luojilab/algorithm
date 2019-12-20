#include <time.h>
#include <iostream>
#include <vector>

#include "big_number.h"

static const int kLimitGridCount = 100;

//随机障碍比例
static const float kRandomObstaclePercent = 0.3;

static std::string &StaticObstacleString() {
    static std::string *obstacle_string = new std::string("1");
    return *obstacle_string;
}

static std::string &StaticInvalidCount() {
    static std::string *obstacle_string = new std::string("-1");
    return *obstacle_string;
}

template <int m, int n>
std::string** ConvertArrayToPointer(int (&obstacle_grid)[m][n]) {
    
    std::string **result_grid = new std::string*[m];
    
    for (int i = 0; i < m; ++i) {
        result_grid[i] = new std::string[n];
        
        for (int j = 0; j < n; ++j) {
            result_grid[i][j] = std::to_string(obstacle_grid[i][j]);
        }
    }
    
    return result_grid;
}

template <int m, int n>
std::string **MakeObstacleGrid() {
    static_assert(m > 0 && m <= kLimitGridCount, "m must > 0 and <= 100");
    static_assert(n > 0 && n <= kLimitGridCount, "n must > 0 and <= 100");
    
    std::string **obstacle_grid = new std::string*[m];
    
    for (int i = 0; i < m; ++i) {
        obstacle_grid[i] = new std::string[n];
        
        int random_count = (int)(n * kRandomObstaclePercent);
        
        for (int j = 0; j < n; ++j) {
            obstacle_grid[i][j] = "0";
        }
        
        for (int j = 0; j < random_count; ++j) {
            obstacle_grid[i][arc4random() % n] = StaticObstacleString();
        }
    }
    
    obstacle_grid[0][0] = std::to_string(0);
    obstacle_grid[m - 1][n - 1] = std::to_string(0);
    
    return obstacle_grid;
}

template <int m, int n>
void DestroyObstacleGrid(std::string **obstacle_grid) {
    static_assert(m > 0 && m <= kLimitGridCount, "m must > 0 and <= 100");
    static_assert(n > 0 && n <= kLimitGridCount, "n must > 0 and <= 100");
    
    if (obstacle_grid == NULL) {
        return;
    }
    
    for (int i = 0; i < m; ++i) {
        delete []obstacle_grid[i];
    }
    
    delete []obstacle_grid;
}

template <int m, int n>
std::string RecursiveUniquePathsII(std::string **obstacle_grid, int i, int j) {
    if (obstacle_grid == NULL) {
        return std::to_string(0);
    }
    
    if (obstacle_grid[i][j] == StaticObstacleString()) {
        return std::to_string(0);
    }
    
    if (i == 0 && j == 0) {
        if (obstacle_grid[i][j] == StaticObstacleString()) {
            return std::to_string(0);
        } else {
            return std::to_string(1);
        }
    }
    
    if (i == 0 && j >= 1) {
        return RecursiveUniquePathsII<m, n>(obstacle_grid, i, j -1);
    }
    
    if (i >= 1 && j == 0) {
        return RecursiveUniquePathsII<m, n>(obstacle_grid, i - 1, j);
    }
    
    std::string dp1 = RecursiveUniquePathsII<m, n>(obstacle_grid, i - 1, j);
    std::string dp2 = RecursiveUniquePathsII<m, n>(obstacle_grid, i, j - 1);
    return future_base::BigIntegerAdd(dp1, dp2);
}

template <int m, int n>
std::string UniquePathsII(std::string **obstacle_grid) {
    std::string unique_path_count = StaticInvalidCount();
    
    if (m <= 0 || n <= 0) {
        return unique_path_count;
    }
    
    if (m > kLimitGridCount || n > kLimitGridCount) {
        return unique_path_count;
    }
    
    //1.递归解法
    //unique_path_count = RecursiveUniquePathsII<m, n>(obstacle_grid, m - 1, n - 1);
    //return unique_path_count;
    
    printf("---------------\n");
    printf("Origin obstacle grid:\n");
    for (size_t i = 0; i < m; ++i) {
        for (size_t j = 0; j < n; ++j) {
            printf("%s\t", obstacle_grid[i][j].c_str());
        }
        printf("\n");
    }
    printf("Result grid:\n");
    
    //2.用二维数组存储
    /*
    std::vector<std::vector<std::string> > result_count_array(m + 1, std::vector<std::string>(n + 1, "0"));
    
    result_count_array[0][1] = std::to_string(1);
    
    for (size_t i = 0; i <= 0; ++i) {
        for (size_t j = 0; j <= n; ++j) {
            printf("%s\t", result_count_array[i][j].c_str());
        }
    }
    
    printf("\n");
        
    for (size_t i = 1; i <= m; ++i) {
        
        printf("%s\t", result_count_array[i][0].c_str());
        
        for (size_t j = 1; j <= n; ++j) {
            if (obstacle_grid[i - 1][j - 1] == StaticObstacleString()) {
                printf("%s\t", result_count_array[i][j].c_str());
                continue;
            }
            
            result_count_array[i][j] = future_base::BigIntegerAdd(result_count_array[i - 1][j],
                                                                 result_count_array[i][j - 1]);
            
            printf("%s\t", result_count_array[i][j].c_str());
        }
        printf("\n");
    }
    
    unique_path_count = result_count_array[m][n];
    
    return unique_path_count;
    */
    
    //3.修改原来数组
    for (size_t i = 0; i < m; ++i) {
        for (size_t j = 0; j < n; ++j) {
            if (obstacle_grid[i][j] == StaticObstacleString()) {
                obstacle_grid[i][j] = std::to_string(0);
                printf("%s\t", obstacle_grid[i][j].c_str());
                continue;
            } else if (i == 0 && j == 0) {
                obstacle_grid[0][0] = std::to_string(1); //如果开始不是障碍，则路径为1
                printf("%s\t", obstacle_grid[i][j].c_str());
                continue;
            }

            if (i == 0) {
                obstacle_grid[i][j] = obstacle_grid[i][j - 1];
            } else if (j == 0) {
                obstacle_grid[i][j] = obstacle_grid[i - 1][j];
            } else {
                obstacle_grid[i][j] = future_base::BigIntegerAdd(obstacle_grid[i - 1][j],
                                                                obstacle_grid[i][j - 1]);
            }
            
            printf("%s\t", obstacle_grid[i][j].c_str());
        }
        
        printf("\n");
    }

    unique_path_count = obstacle_grid[m - 1][n - 1];
    return unique_path_count;
    
    //4.基于3的优化，更易读
    /*
    if (obstacle_grid[0][0] == StaticObstacleString()) {
        return std::to_string(0);
    } else {
        obstacle_grid[0][0] = std::to_string(1); //起始位置如果开始不是障碍，则路径数为1
    }
    
    for (size_t j = 1; j < n; ++j) {
        if (obstacle_grid[0][j] == StaticObstacleString()) {
            obstacle_grid[0][j] =  std::to_string(0);
            continue;
        }
        obstacle_grid[0][j] = obstacle_grid[0][j - 1];
    }
    
    for (size_t i = 1; i < m; ++i) {
        if (obstacle_grid[i][0] == StaticObstacleString()) {
            obstacle_grid[i][0] = std::to_string(0);
            continue;
        }
        obstacle_grid[i][0] = obstacle_grid[i - 1][0];
    }
    
    for (size_t i = 1; i < m; ++i) {
        for (size_t j = 1; j < n; ++j) {
            if (obstacle_grid[i][j] == StaticObstacleString()) {
                obstacle_grid[i][j] = std::to_string(0);
                continue;
            }
            
            obstacle_grid[i][j] = future_base::BigIntegerAdd(obstacle_grid[i - 1][j],
                                                            obstacle_grid[i][j - 1]);
        }
    }
    unique_path_count = obstacle_grid[m - 1][n - 1];
    */
    
    return unique_path_count;
}

int main(int argc, const char * argv[]) {
    
    {
        int obstacle_grid[][1] = {
            {1}
        };
        
        const int m = 1;
        const int n = 1;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }

    {
        int obstacle_grid[][1] = {
            {0}
        };
        
        const int m = 1;
        const int n = 1;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }


    {
        int obstacle_grid[][2] = {
            {0, 0}
        };
        
        const int m = 1;
        const int n = 2;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }

    {
        int obstacle_grid[][2] = {
            {0, 0},
            {0, 0}
        };
        
        const int m = 2;
        const int n = 2;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }

    {
        int obstacle_grid[][3] = {
            {0, 0, 0},
            {0, 0, 0},
            {0, 0, 0},
            {0, 0, 0}
        };
        
        const int m = 4;
        const int n = 3;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }
    
    {
        int obstacle_grid[][3] = {
            {0, 0, 0},
            {0, 1, 0},
            {0, 0, 0},
            {0, 0, 0}
        };
        
        const int m = 4;
        const int n = 3;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }
    
    {
        int obstacle_grid[][4] = {
            {0, 0, 0, 0},
            {0, 0, 0, 0},
            {0, 0, 1, 0},
            {1, 0, 0, 0},
            {0, 0, 0, 0}
        };
        
        const int m = 5;
        const int n = 4;
        
        std::string **int64_grid = ConvertArrayToPointer<m, n>(obstacle_grid);
        std::string count = UniquePathsII<m, n>(int64_grid);
        DestroyObstacleGrid<m, n>(int64_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }
    
    {
        const int m = 7;
        const int n = 3;
        
        std::string **random_obstacle_grid = MakeObstacleGrid<m, n>();
        std::string count = UniquePathsII<m, n>(random_obstacle_grid);
        DestroyObstacleGrid<m, n>(random_obstacle_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }
    
    {
        const int m = 30;
        const int n = 30;

        std::string **random_obstacle_grid = MakeObstacleGrid<m, n>();
        std::string count = UniquePathsII<m, n>(random_obstacle_grid);
        DestroyObstacleGrid<m, n>(random_obstacle_grid);
        
        printf("Unique path count is:%s\n\n", count.c_str());
    }
    
    return 0;
}
