
public class MultipleKnapsackProblem {
    private static int[] values = {2, 4, 3, 7};
    private static int[] weights = {2, 3, 5, 5};
    private static int[] numbers = {1, 1, 3, 2};

    private static int W = 10;
    private static int[][] results = new int[values.length + 1][W + 1];

    public static void main(String[] args) {
        MultipleKnapsackProblem test = new MultipleKnapsackProblem();
        System.out.println(test.dpMkp());
        System.out.println(test.dpMkpRecurise(values.length, W));
    }

    private int dpMkp() {

        for (int i = 0; i <= values.length; i++) {
            results[i][0] = 0;
        }

        for (int j = 0; j <= W; j++) {
            results[0][j] = 0;
        }

        for (int i = 1; i <= values.length; i++) {
            for (int j = 1; j <= W; j++) {
                if (j < weights[i - 1]) {
                    results[i][j] = results[i - 1][j];
                } else {
                    for (int k = 0; k <= numbers[i - 1] && k * weights[i - 1] <= j; k++) {
                        int temp = results[i - 1][j - k * weights[i - 1]] + k * values[i - 1];
                        if (temp > results[i][j]) {
                            results[i][j] = temp;
                        }
                    }
                }
                System.out.print(results[i][j] + " ");
            }
            System.out.println();
        }

        return results[values.length][W];
    }


    /**
     * 递归
     *
     * @param i
     * @param j
     * @return
     */
    private int dpMkpRecurise(int i, int j) {
        int result = 0;

        if (i == 0 || j == 0) {
            return result;
        }
        if (j < weights[i - 1]) {
            result = dpMkpRecurise(i - 1, j);
        } else {
            for (int k = 0; k <= numbers[i - 1] && k * weights[i - 1] <= j; k++) {
                int temp = dpMkpRecurise(i - 1, j - weights[i - 1] * k) + values[i - 1] * k;
                if (temp > result) {
                    result = temp;
                }
            }
        }

        return result;
    }
}
