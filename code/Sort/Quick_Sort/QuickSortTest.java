package Sort.Quick_Sort;

import java.util.Arrays;

public class QuickSortTest {

    public static void main(String[] args) {
        int[] arr = {8, 9, 7, 6, 11, 4, 56, 4, 3, 1, 56, 4, 6, 32, 23, 2, 1, 5, 74, 24, 33, 1, 27, 37, 74, 1, 32,
                41, 74, 5, 23, 36, 6, 32, 23, 21, 11, 5, 94, 2, 3, 18, 2, 37, 74, 1, 3, 41,
                74, 5, 23, 34, 456, 564, 465, 563411, 218, 456, 486, 45, 78, 213, 897, 12, 45, 123, 45, 12, 152, 45857, 3, 2785, 21, 0};
//        quickSort(arr, 0, arr.length - 1);
        quickSort2Way(arr, 0, arr.length - 1);
//        quickSort3Way(arr, 0, arr.length - 1);
        System.out.println(Arrays.toString(arr));
    }

    /**
     * 普通快排
     * @param arr
     */
    public static void quickSort(int[] arr, int l, int r) {
        if (arr == null || arr.length == 0) {
            return;
        }

        if (l >= r) {
            return;
        }
        int p = partition(arr, l, r);
        quickSort(arr, l, p - 1);
        quickSort(arr, p + 1, r);
    }

    private static int partition(int[] arr, int l, int r) {
        swap(arr, l, (int) (Math.random() * (r - l + 1)) + l);

        // arr[l + 1, j] < v, arr[j + 1, i - 1] > v
        int v = arr[l];
        int j = l;
        for (int i = l + 1; i <= r; i++) {
            if (arr[i] < v) {
                swap(arr, i, j + 1);
                j++;
            }
        }
        swap(arr, l, j);
        return j;
    }


    /**
     * 双路快排
     * @param arr
     */
    public static void quickSort2Way(int[] arr, int l, int r) {
        if (arr == null || arr.length == 0) {
            return;
        }

        if (l >= r) {
            return;
        }
        int p = partition2(arr, l, r);
        quickSort(arr, l, p - 1);
        quickSort(arr, p + 1, r);
    }

    private static int partition2(int[] arr, int l, int r) {
        swap(arr, l, (int) (Math.random() * (r - l + 1)) + l);

        int v = arr[l];
        int i = l + 1, j = r;

        // arr[l + 1, i - 1] <= v, arr[j + 1, r] >= v
        while (true) {
            while (i <= r && arr[i] < v) {
                i++;
            }
            while (j >= l + 1 && arr[j] > v) {
                j--;
            }
            if (i > j) {
                break;
            }
            swap(arr, i, j);
            i++;
            j--;
        }
        swap(arr, l, j);
        return j;
    }


    /**
     * 三路快排
     * @param arr
     */
    public static void quickSort3Way(int[] arr, int l, int r) {
        if (l >= r) {
            return;
        }

        swap(arr, l, (int) (Math.random() * (r - l + 1)) + l);
        int v = arr[l];

        int lt = l;     // arr[l + 1 , lt] < v
        int gt = r + 1;   // arr[gt , r] > v
        int i = l + 1;    // arr[lt + 1, i - 1] == v

        while(i < gt) {
            if (arr[i] < v) {
                swap(arr, i, lt + 1);
                lt++;
                i++;
            } else if (arr[i] > v) {
                swap(arr, i, gt - 1);
                gt--;
            } else {
                i++;
            }
        }
        swap(arr, l, lt);
        lt--;

        quickSort3Way(arr, l, lt);
        quickSort3Way(arr, gt, r);
    }


    private static void swap(int[] arr, int a, int b) {
        int temp = arr[a];
        arr[a] = arr[b];
        arr[b] = temp;
    }
}
