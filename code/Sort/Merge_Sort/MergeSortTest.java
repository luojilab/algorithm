package Sort.Merge_Sort;

import java.util.Arrays;

public class MergeSortTest {
    public static void main(String[] args) {
        int[] array = new int[]{8, 13, 2, 77, 34, 9, 66, 32, 65, 99};
        mergeSort(array);
        System.out.print(Arrays.toString(array));
    }

    public static void mergeSort(int[] array) {
        if (array == null || array.length == 0) {
            return;
        }
        int[] temp = new int[array.length];
        divide(array, 0, temp.length - 1, temp);
    }

    private static void divide(int[] array, int left, int right, int[] temp) {
        if (left < right) {
            int mid = (left + right) / 2;
            divide(array, left, mid, temp);
            divide(array, mid + 1, right, temp);
            merge(array, left, mid, right, temp);
        }
    }

    private static void merge(int[] array, int left, int mid, int right, int[] temp) {
        int l = left;
        int r = mid + 1;
        int t = 0;
        while (l <= mid && r <= right) {
            temp[t++] = array[l] < array[r] ? array[l++] : array[r++];
        }
        while (l <= mid) {
            temp[t++] = array[l++];
        }
        while (r <= right) {
            temp[t++] = array[r++];
        }
        t = 0;
        while (left <= right) {
            array[left++] = temp[t++];
        }
    }
}
