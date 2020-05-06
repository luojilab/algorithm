package com;

public class BinarySearch {

    double findMiddleNumber(int[] numberA, int[] numberB) {

        //不管m+n是奇数还是偶数， (m+n+1) / 2 和 (m+n+2) / 2 取整，永远是正确的
        //寻找指定k位置的值,k从1开始

        int m = numberA.length;
        int n = numberB.length;
        int leftK = (m + n + 1) / 2;
        int rightK = (m + n + 2) / 2;

        System.out.println(findK(numberA, 0, numberB, 0, leftK) + "");
        System.out.println(findK(numberA, 0, numberB, 0, rightK) + "");

        return (findK(numberA, 0, numberB, 0, leftK) + findK(numberA, 0, numberB, 0, rightK)) / 2.0;
    }


    int findK(int[] numberA, int startIndexA, int[] numberB, int startIndexB, int positionK) {

        //边界条件
        if (startIndexA >= numberA.length) {
            return numberB[startIndexB + positionK - 1];
        }
        if (startIndexB >= numberB.length) {
            return numberA[startIndexA + positionK - 1];
        }

        //position 递归的末尾，直接就是1了，直接比两个大小即可
        if (positionK == 1) {
            int a = numberA[startIndexA];
            int b = numberB[startIndexB];
            return Math.min(a, b);
        }

        int halfKPosition = positionK / 2;//取k的1/2位置

        if (numberA.length - (startIndexA) < halfKPosition) {
            //剔除B起始位置halfKPosition个元素
            return findK(numberA, startIndexA, numberB, startIndexB + halfKPosition, positionK - halfKPosition);
        } else if (numberB.length - (startIndexB) < halfKPosition) {
            //剔除A起始位置halfKPosition个元素
            return findK(numberA, startIndexA + halfKPosition, numberB, startIndexB, positionK - halfKPosition);
        } else {
            int a = numberA[startIndexA + halfKPosition - 1];
            int b = numberB[startIndexB + halfKPosition - 1];
            if (a > b) {
                return findK(numberA, startIndexA, numberB, startIndexB + halfKPosition, positionK - halfKPosition);
            } else {
                return findK(numberA, startIndexA + halfKPosition, numberB, startIndexB, positionK - halfKPosition);
            }
        }
    }

}
