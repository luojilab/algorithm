package com.example.lib;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;

import sun.rmi.runtime.Log;

public class MyClass {
    public static void main(String[] args) {

        randomText();


//        int[] ints1 = {-1, 0, 1, 2, -1, -4};
//        show(ints1);
//        int[] ints = Solution.twoSum(ints1, 0);
//        int[] ints = Solution.twosum2(ints1, 0);
//        int[] ints = Solution.twosum3(ints1, 0);


//        ArrayList<ResultBean> result = Solution.threeSum(ints1);
//        showResult(result);

//        ArrayList<ResultBean> result2 = Solution.threeSum2(ints1);
//        showResult(result2);


//        ArrayList<ResultBean> result3 = Solution.threeSum3(ints1);
//        showResult(result3);
    }

    public static void showResult(ArrayList<ResultBean> resultBean, String time) {
        Collections.sort(resultBean, new Comparator<ResultBean>() {
            @Override
            public int compare(ResultBean resultBean, ResultBean t1) {
                Arrays.sort(resultBean.arr);
                Arrays.sort(t1.arr);
                return resultBean.arr[0] - t1.arr[0];
            }
        });
        System.out.println("=======================size " + resultBean.size() + "  " + "time " + time);
//        for (int i = 0; i < resultBean.size(); i++) {
//            int[] ints = resultBean.get(i).arr;
//            show(ints);
//        }
//        System.out.println("=======================");

    }

    public static void randomText() {

        int max = 100;
        int min = -100;


        int[] ints = new int[3000];
        for (int j = 0; j < 3000; j++) {
            ints[j] = new Random().nextInt(max - min + 1) + min;
        }
        show(ints);

        long time1 = System.currentTimeMillis();
//        ArrayList<ResultBean> result = Solution.threeSum(ints);
        long time2 = System.currentTimeMillis();

        ArrayList<ResultBean> result1 = Solution.threeSum1(ints);
        long time3 = System.currentTimeMillis();

        ArrayList<ResultBean> result2 = Solution.threeSum2(ints);
        long time4 = System.currentTimeMillis();
//        ArrayList<ResultBean> result3 = new ArrayList<>(Solution.threeSumHash(ints));
        long time5 = System.currentTimeMillis();

       //暴力法
//        showResult(result,String.valueOf(time2-time1));

        //hash 空间
//        showResult(result3,String.valueOf(time5-time4) );

        //优化前
        showResult(result1,String.valueOf(time3-time2));


        //优化后
        showResult(result2,String.valueOf(time4-time3));


    }

    public static void show(int[] arrs) {
        StringBuffer stringBuffer = new StringBuffer("{");
        for (int i = 0; i < arrs.length; i++) {
            if (i != arrs.length - 1) {
                stringBuffer.append(arrs[i] + ",");
            } else {
                stringBuffer.append(arrs[i] + "}");
            }
        }
        System.out.println(stringBuffer.toString());
    }


}
