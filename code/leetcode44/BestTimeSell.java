
public class BestTimeSell {
    //方法1
    public int maxProfit(int[] prices) {
        int maxProfit = 0;
        for (int i = 0; i < prices.length - 1; i++) {
            for (int j = i + 1; j < prices.length; j++) {
                int profit = prices[j] - prices[i];
                if (profit > maxProfit) {
                    maxProfit = profit;
                }
            }
        }
        return maxProfit;
    }

    //方法2
    public int maxProfit(int[] prices) {
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;
        for (int i = 0; i < prices.length; i++) {
            if (prices[i] < minPrice) {
                minPrice = prices[i];
            } else if (prices[i] - minPrice > maxProfit) {
                maxProfit = prices[i] - minPrice;
            }
        }
        return maxProfit;
    }

    //方法3
    public int maxProfit(int[] prices) {
        int max_profit = 0, min_prices = Integer.MAX_VALUE;
        for (int i = 0; i < prices.length; i++) {
            min_prices = Math.min(min_prices, prices[i]);
            max_profit = Math.max(max_profit, prices[i] - min_prices);
        }
        return max_profit;
    }
}
