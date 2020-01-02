package com.example.lib;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;


public class Solution {

    /**
     * 暴力解法
     *
     * @param arr    数组
     * @param target 目标
     * @return
     */
    public static int[] twoSum(int[] arr, int target) {
        if (arr.length < 2) {
            return null;
        }
        for (int i = 0; i < arr.length - 1; i++) {
            //每个人
            for (int j = i + 1; j < arr.length; j++) {
                // 都去问其他的人
                if (arr[i] + arr[j] == target) {
                    return new int[]{arr[i], arr[j]};
                }
            }
        }
        return null;
    }

    /**
     * 优化
     *
     * @param arr
     * @param target
     * @return
     */
    public static int[] twosum2(int[] arr, int target) {
        if (arr.length < 2) {
            return null;
        }
        HashMap<Integer, Integer> integerIntegerHashMap = new HashMap<>();
        // 每个人登记自己想要配对的人，让主持人记住
        for (int i = 0; i < arr.length; i++) {
            integerIntegerHashMap.put(target - arr[i], i);
        }
        for (int j = 0; j < arr.length; j++) {
            // 每个人再次报数的时候，主持人看一下名单里有没有他
            Integer integer = integerIntegerHashMap.get(arr[j]);
            if (integer != null && integer != j) {
                return new int[]{arr[integer], arr[j]};
            }
        }
        return null;
    }

    /**
     * 在优化
     *
     * @param arr
     * @param target
     * @return
     */
    public static int[] twosum3(int[] arr, int target) {
        if (arr.length < 2) {
            return null;
        }
        HashMap<Integer, Integer> integerIntegerHashMap = new HashMap<>();
        for (int j = 0; j < arr.length; j++) {
            // 每个人报出自己想要配对的人
            Integer integer = integerIntegerHashMap.get(arr[j]);
            if (integer != null) {
                // 如果有人被登记过
                return new int[]{arr[j], integer};
            } else {
                integerIntegerHashMap.put(target - arr[j], arr[j]);
            }
        }
        return null;
    }


    public static ArrayList<ResultBean> threeSum(int[] arr) {
        HashSet<ResultBean> ints = new HashSet<>();
        if (arr.length < 3) {
            return null;
        }
        // 每个人
        for (int i = 0; i < arr.length - 2; i++) {
            // 依次拉上其他每个人
            for (int j = i + 1; j < arr.length - 1; j++) {
                // 去问剩下的每个人
                for (int k = j + 1; k < arr.length; k++) {
                    // 我们是不是可以一起组队
                    if (arr[i] + arr[j] + arr[k] == 0) {
                        ResultBean resultBean = new ResultBean(new int[]{arr[i], arr[j], arr[k]});
                        ints.add(resultBean);
                    }
                }
            }
        }
        return new ArrayList<>(ints);
    }


    public static ArrayList<ResultBean> threeSum1(int[] nums) {
        ArrayList<ResultBean> result = new ArrayList<ResultBean>();
        if (nums.length < 3) {

            return result;
        }
        Arrays.sort(nums);
        for (int i = 0; i < nums.length; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;  //选定nums[i]为第一个数，并去重
            }
            int left = i + 1;
            int right = nums.length - 1;
            while (right > left) {
                int sum = nums[i] + nums[left] + nums[right];
                if (sum == 0) {
                    ResultBean resultBean = new ResultBean(new int[]{nums[i], nums[left], nums[right]});
                    result.add(resultBean);
                    while (left < right && nums[left] == nums[left + 1]) {
                        left++;  //去重
                    }
                    while (left + 1 < right && nums[right] == nums[right - 1]) {
                        right--;
                    }
                }
                if (sum <= 0) {
                    left++;
                } else {
                    right--;
                }
            }
        }
        return result;

    }


    public static ArrayList<ResultBean> threeSum2(int[] nums) {
        ArrayList<ResultBean> result = new ArrayList<ResultBean>();
        if (nums.length < 3) {

            return result;
        }
        Arrays.sort(nums);
        // 优化1: 整个数组同符号，则无解
        if (nums[0] * nums[nums.length - 1] > 0) {
            return result;
        }
        for (int i = 0; i < nums.length; i++) {
            // 优化2: 最左值为正数则一定无解
            if (i > 0 && nums[i] == nums[i - 1] || nums[i] > 0) {
                continue;  //选定nums[i]为第一个数，并去重
            }
            int left = i + 1;
            int right = nums.length - 1;
            while (right > left) {
                if (nums[i] * nums[right] > 0) {
                    break;// 两人选相遇，或者三人同符号，则退出
                }
                int sum = nums[i] + nums[left] + nums[right];
                if (sum == 0) {
                    ResultBean resultBean = new ResultBean(new int[]{nums[i], nums[left], nums[right]});
                    result.add(resultBean);
                    while (left < right && nums[left] == nums[left + 1]) {
                        left++;  //去重
                    }
                    while (left + 1 < right && nums[right] == nums[right - 1]) {
                        right--;
                    }
                }
                if (sum <= 0) {
                    left++;
                } else {
                    right--;
                }
            }
        }
        return result;

    }

    public static HashSet<ResultBean> threeSumHash(int[] arrs) {
        HashSet<ResultBean> resultBeans = new HashSet<>();
        for (int i = 0; i < arrs.length; i++) {
            int tager = arrs[i];
            HashSet<ResultBean> twoSumHashResult = twoSumHash(-tager, arrs, i);
            resultBeans.addAll(twoSumHashResult);
        }
        return resultBeans;
    }

    public static HashSet<ResultBean> twoSumHash(int targer, int[] arr, int skip) {
        HashSet<ResultBean> resultBeans = new HashSet<>();
        HashMap<Integer, Integer> integerIntegerHashMap = new HashMap<>();
        for (int j = 0; j < arr.length; j++) {
            if (skip == j) {
                continue;
            }

            // 每个人报出自己想要配对的人
            Integer integer = integerIntegerHashMap.get(arr[j]);
            if (integer != null) {
                // 如果有人被登记过

                ResultBean resultBean = new ResultBean(new int[]{arr[j], integer, -targer});
                resultBeans.add(resultBean);
            } else {
                integerIntegerHashMap.put(targer - arr[j], arr[j]);
            }
        }
        return resultBeans;

    }
}


