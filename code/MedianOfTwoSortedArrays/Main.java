package com;

public class Main {
    public static void main(String[] args) {

        int[] b = new int[]{3, 3, 4, 5, 6, 7, 8, 10, 11, 12, 14, 15};
        int[] a = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22};

        BinarySearch binarySearch = new BinarySearch();
        System.out.println(binarySearch.findMiddleNumber(a, b));

    }

}

