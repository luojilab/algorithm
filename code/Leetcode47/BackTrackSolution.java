package arithmetic.permutation;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class BackTrackSolution {
    /**
     * @param array   排好序的数组
     * @param visited 状态
     * @param depth   搜索深度
     * @param path    搜索路径
     * @param result  结果集
     */
    public void permutation(int[] array, int visited, int depth, Stack<Integer> path, List<List<Integer>> result) {
        int arraySize = array.length;
        if (depth == arraySize) {
            result.add(new ArrayList<>(path));
            return;
        }
        for (int i = 0; i < arraySize; i++) {
            if (notVisited(visited, i)) {
                if (i > 0 && array[i] == array[i - 1] && visited(visited, i - 1)) {
                    continue;
                }
                path.push(array[i]);
                visited ^= 1 << i;
                permutation(array, visited, depth + 1, path, result);
                // 回溯的时候，一定要记得状态重置
                path.pop();
                visited ^= 1 << i;
            }
        }
    }

    private boolean notVisited(int visited, int index) {
        return ((visited >> index) & 1) == 0;
    }

    private boolean visited(int visited, int index) {
        return ((visited >> index) & 1) == 1;
    }

}
