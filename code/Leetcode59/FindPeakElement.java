package com.dixon.leetcode59;

public class FindPeakElement {

    /**
     * 寻找峰值元素
     * <p>
     * 遍历 n
     */
    public static int findPeakElementByTraverse(int[] nums) {
        // 后续这块判断就不加了..这里示范下
        if (nums == null || nums.length == 0) {
            throw new IllegalArgumentException("违规数据");
        }
        if (nums.length == 1) {
            return nums[0];
        }
        // 峰值临时值
        int peakElement = nums[0];
        for (int i = 1; i < nums.length; i++) {
            // 不存在相等的情况
            // 右数比左数小 则左数即为峰值元素
            if (nums[i] < peakElement) {
                return i - 1;
            } else {
                // 右数比左数大 改变峰值临时值 继续寻找
                peakElement = nums[i];
                // 遍历完了 没找到
                if (i == nums.length - 1) {
                    return i;
                }
            }
        }
        return -1;
    }

    /**
     * 寻找峰值元素
     * <p>
     * 遍历 n
     */
    public static int findPeakElementByTraverseOptimization(int[] nums) {
        for (int i = 1; i < nums.length; ++i) {
            if (nums[i] < nums[i - 1]) return i - 1;
        }
        return nums.length - 1;
    }

    /**
     * 寻找峰值元素
     * <p>
     * 二分法 logN
     */
    public static int findPeakElementByDivide(int[] nums) {
        int start = 0;
        int end = nums.length - 1;
        int middle = 0;
        while (start < end) {
            middle = (start + end) / 2;
            // 峰值在右边
            if (nums[middle] < nums[middle + 1]) {
                start = middle + 1;
            } else {
                // 峰值在左边
                end = middle;
            }
        }
        // 判断是否满足终止条件：
        // start == end 二分到了最后一位 注意 此时middle可能没变
        return start;
    }

    /**
     * 寻找峰值元素
     * <p>
     * 二分法 logN 优化
     */
    public static int findPeakElementByDivideOptimization(int[] nums) {
        int start = 0;
        int end = nums.length - 1;
        int middle = 0;
        while (start < end) {
            middle = (start + end) / 2;
            // 峰值在右边
            if (nums[middle] < nums[middle + 1]) {
                start = middle + 1;
            } else {
                // 当前值比右值大 峰值在左边
                // 优化 因为找到一个即可 所以没必要二分到底
                if (middle != 0 && nums[middle] > nums[middle - 1]) {
                    return middle;
                }
                end = middle;
            }
        }
        // 判断是否满足终止条件：
        // start == end 二分到了最后一位
        return start;
    }

    // 这是迭代二分查找 另外还有递归二分查找 只不过空间复杂度更高 没什么区别
}
