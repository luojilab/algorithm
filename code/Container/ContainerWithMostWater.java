package Container;

public class ContainerWithMostWater {


    public static void main(String[] args) {
        int[] array = new int[]{1, 8, 6, 2, 5, 4, 8, 3, 7};
        int maxContainer = maxArea(array);
        System.out.println("盛最多水的容器为" + maxContainer);
    }

    public static int maxArea(int[] arr) {
        int leftIndex = 0;
        int rightIndex = arr.length - 1;
        int maxContainer = 0;
        while (leftIndex < rightIndex) {
            int area = Math.abs(leftIndex - rightIndex) * Math.min(arr[leftIndex], arr[rightIndex]);
            maxContainer = Math.max(maxContainer, area);
            if (arr[leftIndex] <= arr[rightIndex]) {
                leftIndex++;
            } else {
                rightIndex--;
            }
        }
        return maxContainer;
    }
}
