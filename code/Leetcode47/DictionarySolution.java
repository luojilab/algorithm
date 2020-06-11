package arithmetic.permutation;

import java.util.ArrayList;
import java.util.List;

/**
 * 字典序排列
 */
public class DictionarySolution {

    /**
     * @param array  排好序的数组
     * @param output
     */
    public void permutation(ArrayList<Integer> array, List<List<Integer>> output) {
        if (array == null) {
            return;
        }
        if (output == null) {
            output = new ArrayList<>();
        }
        if (array.size() < 2) {
            output.add(new ArrayList<>(array));
        } else {
            while (true) {
                if (!getNextPerm(array, output)) {
                    return;
                }
            }
        }
    }

    /**
     * 得到下一个排列
     *
     * @param array
     * @param output
     */
    private boolean getNextPerm(ArrayList<Integer> array, List<List<Integer>> output) {
        output.add(new ArrayList<>(array));
        int firstLessIndex = -1;
        int size = array.size();

        //找到第一个左边<右边的数X = nums[firstLessIndex]，firstLessIndex后全是倒序
        for (int i = size - 1; i > 0; i--) {
            if (array.get(i - 1) < array.get(i)) {
                firstLessIndex = i - 1;
                break;
            }
        }

        //如果没找到，则说明已经是最后一个序列了
        if (firstLessIndex == -1)
            return false;

        for (int j = size - 1; j > firstLessIndex; j--) {
            //从后往前，找到第一个大于X的数Y
            if (array.get(j) > array.get(firstLessIndex)) {
                //交换X和Y
                swap(array, j, firstLessIndex);
                //将firstLessIndex后边的数逆置
                reverse(array, firstLessIndex + 1, size - 1);
                return true;
            }
        }
        return false;
    }

    /**
     * 数组部分数据翻转
     *
     * @param array 原始数组
     * @param from  开始位置
     * @param to    结束位置
     */
    private void reverse(ArrayList<Integer> array, int from, int to) {
        while (from < to) {
            swap(array, from++, to--);
        }
    }

    /**
     * 数组中两个数据位置交换
     *
     * @param array 数组
     * @param from  开始位置
     * @param to    结束位置
     */
    private void swap(ArrayList<Integer> array, int from, int to) {
        int size = array.size();
        if (from < size && to < size) {
            Integer temp = array.get(from);
            array.set(from, array.get(to));
            array.set(to, temp);
        }
    }
}
