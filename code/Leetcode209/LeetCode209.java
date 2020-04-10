public class LeetCode209 {
    public static void main(String[] args) {
        int[] nums = new int[]{1,1,2, 3, 1, 2, 4, 3,4,2};
        int s = 100;
        
        int ans = minSubArrayLen1(s, nums);
        
        System.out.println("result ans:" + ans);
    }
    
    public static int minSubArrayLen1(int s, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                int sum = 0;
                for (int k = i; k <= j; k++) {
                    sum += nums[k];
                }
                if (sum >= s) {
                    ans = Math.min(ans, (j - i + 1));
                    break;
                }
            }
        }
        return (ans != Integer.MAX_VALUE) ? ans : 0;
    }
    
    public static int minSubArrayLen2(int s, int[] nums) {
        int n = nums.length;
        if (n == 0) {
            return 0;
        }
        
        int ans = Integer.MAX_VALUE;
        
        int[] sums = new int[n];
        sums[0] = nums[0];
        
        for (int i = 1; i < n; i++) {
            sums[i] = sums[i - 1] + nums[i];
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                int sum = sums[j] - sums[i] + nums[i];
                if (sum >= s) {
                    ans = Math.min(ans, (j - i + 1));
                    break;
                }
            }
        }
        return (ans != Integer.MAX_VALUE) ? ans : 0;
    }
    
    public static int minSubArrayLen3(int s, int[] nums) {
        if (nums.length == 0) {
            return 0;
        }
        int result = Integer.MAX_VALUE;
        int[] sums = new int[nums.length + 1];
        for (int i = 1; i < sums.length; i++) {
            sums[i] = sums[i - 1] + nums[i - 1];
        }
        for (int i = 1; i < sums.length; i++) {
            int tmp = lowerBound(sums, 0, sums.length, s + sums[i - 1]);
            if (tmp != -1) {
                result = Math.min(result, tmp - i + 1);
            }
        }
        if (result == Integer.MAX_VALUE) {
            return 0;
        }
        return result;
    }
    
    private static int lowerBound(int[] nums, int L, int R, int target) {
        while (L < R) {
            int mid = L + (R - L) / 2;
            if (target <= nums[mid]) {
                R = mid;
            } else {
                L = mid + 1;
            }
        }
        if (L == nums.length) return -1;
        return L;
    }
    
    public static int minSubArrayLen4(int s, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        
        int left = 0;
        int sum = 0;
        
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            while (sum >= s) {
                ans = Math.min(ans, i + 1 - left);
                sum -= nums[left++];
            }
        }
        return (ans != Integer.MAX_VALUE) ? ans : 0;
    }
}
