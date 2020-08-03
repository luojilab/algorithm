package arithmetic.permutation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RecursiveSolution {
    /**
     * 递归算法
     *
     * @param array  当前待排序的集合
     * @param output 存放结果的集合
     * @param depth  已经选取的数字个数
     */
    public void permutation(ArrayList<Integer> array, List<List<Integer>> output, int depth) {
        if (array == null) {
            return;
        }
        int arraySize = array.size();
        if (depth == arraySize) {
            output.add(new ArrayList<>(array));
        }
        for (int i = depth; i < arraySize; i++) {
            if (isRepeat(array, depth, i)) {
                continue;
            }
            Collections.swap(array, depth, i);
            permutation(array, output, depth + 1);
            Collections.swap(array, depth, i);
        }
    }

    /**
     * 是否有重复
     *
     * @param array
     * @param fromIndex
     * @param targetIndex
     */
    private boolean isRepeat(ArrayList<Integer> array, int fromIndex, int targetIndex) {
        int targetValue = array.get(targetIndex);
        for (int i = fromIndex; i < targetIndex; i++) {
            if (array.get(i) == targetValue) {
                return true;
            }
        }
        return false;
    }
}
