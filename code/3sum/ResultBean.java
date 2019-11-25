package com.example.lib;

import java.util.ArrayList;
import java.util.Arrays;

public class ResultBean {
    public int[] arr;

    @Override
    public boolean equals(Object o) {
        if (o instanceof ResultBean) {
            ResultBean o1 = (ResultBean) o;
            ArrayList<Integer> integers = new ArrayList<>();
            for (int i = 0; i < o1.arr.length; i++) {
                integers.add(o1.arr[i]);
            }

            for (int i = 0; i < arr.length; i++) {
                if (!integers.contains(arr[i])) {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int hashCode() {
        Arrays.sort(arr);
        StringBuilder stringBuffer = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            stringBuffer.append(arr[i]+"");
        }
        return stringBuffer.toString().hashCode();
    }

    @Override
    public String toString() {
        Arrays.sort(arr);
        StringBuilder stringBuffer = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            stringBuffer.append(arr[i]+"");
        }
        return stringBuffer.toString();
    }

    public ResultBean(int[] arr) {
        this.arr = arr;
    }
}
