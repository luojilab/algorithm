/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LeetCodeDemo;

/**
 *
 * @author dixon.xu
 */
public class CandyCode {
    
    // 左右遍历
    // 时间复杂度 On
    // 空间复杂度 On
    public static int methodA(int[] ratings){
        int res = 0;
        int[] nums = new int[ratings.length];
        for(int i = 0; i < nums.length; i++){
            nums[i] = 1;
        }
        for(int i = 0; i < nums.length - 1; i++){
            if(ratings[i + 1] > ratings[i]){
                nums[i + 1] = nums[i] + 1;
            }
        }
        for(int i = nums.length - 1; i > 0; i--){
            if(ratings[i - 1] > ratings[i]){
                nums[i - 1] = nums[i] + 1 > nums[i - 1] ? nums[i] + 1 : nums[i - 1];
            }
        }
        for(int num : nums) res += num;
        return res;
    }
    
    // 升序分割后回朔
    // 基本等同于MethodA的变体
    public static int methodB(int[] ratings){
        int res = 0;
        int[] nums = new int[ratings.length];
        //设置第一位为1
        nums[0] = 1;
        for(int i = 0; i < nums.length - 1; i++){
            if(ratings[i + 1] > ratings[i]){
                nums[i + 1] = nums[i] + 1;
            }else{
                //新序列
                nums[i + 1] = 1;
            }
        }
        for(int i = nums.length - 1; i > 0; i--){
            if(ratings[i - 1] > ratings[i] && nums[i - 1] <= nums[i]){
                nums[i - 1] = nums[i] + 1;
            }
        }
        for(int num : nums) res += num;
        return res;
    }
    
    // 一次循环
    public static int methodC(int[] ratings){
        int[] nums = new int[ratings.length];
        int res = 1, pre = 1, cnt = 0;
        for (int i = 1; i < ratings.length; ++i) {
            if (ratings[i] >= ratings[i - 1]) {
                if (cnt > 0) {
                    res += cnt * (cnt + 1) / 2;
                    if (cnt >= pre) res += cnt + 1 - pre; 
                    cnt = 0;
                    pre = 1;
                }
                pre = (ratings[i] == ratings[i - 1]) ? 1 : pre + 1;
                res += pre;
            } else {
                ++cnt;
            }
        }     
        if (cnt > 0) {
            res += cnt * (cnt + 1) / 2;
            if (cnt >= pre) res += cnt + 1 - pre;
        }
        return res;
    }
    
    // 输出数组数据 用于测试
    private static void print(int[] array){
        for(int i : array) System.out.print(i);
        System.out.println();
    }
}
