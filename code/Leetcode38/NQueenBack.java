
import java.util.ArrayList;
import java.util.List;

public class NQueenBack {

    private static int QUEEN_COUNT =8;
    // 用于标记是否被列方向的皇后被攻击
    int[] rows;
    // 用于标记是否被主对角线方向的皇后攻击
    int[] mains;
    // 用于标记是否被次对角线方向的皇后攻击
    int[] secondary;
    // 
    int[] queens;

    private int resultCount;


    public static void main(String[] args) {
        NQueenBack nQueen = new NQueenBack(QUEEN_COUNT);
    }

    public NQueenBack(int n) {
        // Long startTs = System.currentTimeMillis();
        solveNQueens();
        // Long endTs = System.currentTimeMillis();
        // long l = endTs - startTs;
        // System.out.println("耗时：" + l);
        System.out.println("当有" + QUEEN_COUNT + "皇后时，共有" + resultCount + "种放置方法");
    }

    public void solveNQueens() {
        // 初始化
        rows = new int[QUEEN_COUNT];
        mains = new int[2 * QUEEN_COUNT - 1];
        secondary = new int[2 * QUEEN_COUNT - 1];
        queens = new int[QUEEN_COUNT];
        // 从第一行开始回溯求解 N 皇后
        backtrack(0);
    }

    // 在一行中放置一个皇后
    private void backtrack(int row) {
        if (row >= QUEEN_COUNT) {
            addSolution();
            return;
        }
        // 分别尝试在 row 行中的每一列中放置皇后
        for (int col = 0; col < QUEEN_COUNT; col++) {
            // 判断当前放置的皇后不被其他皇后的攻击
            if (isNotUnderAttack(row, col)) {
                // 选择，在当前的位置上放置皇后
                placeQueen(row, col);
                // 在下一行中放置皇后
                backtrack(row + 1);
                // 撤销，回溯，即将当前位置的皇后去掉
                removeQueen(row, col);
            }
        }
    }

    // 判断 row 行，col 列这个位置有没有被其他方向的皇后攻击
    private boolean isNotUnderAttack(int row, int col) {
        // 判断的逻辑是：
        //      1. 当前位置的这一列方向没有皇后攻击
        //      2. 当前位置的主对角线方向没有皇后攻击
        //      3. 当前位置的次对角线方向没有皇后攻击
        int res = rows[col] + mains[row - col + QUEEN_COUNT - 1] + secondary[row + col];
        // 如果三个方向都没有攻击的话，则 res = 0，即当前位置不被任何的皇后攻击
        return res == 0;
    }

    // 在指定的位置上放置皇后
    private void placeQueen(int row, int col) {
        // 在 row 行，col 列 放置皇后
        queens[row] = col;
        // 当前位置的列方向已经有皇后了
        rows[col] = 1;
        // 当前位置的主对角线方向已经有皇后了
        mains[row - col + QUEEN_COUNT - 1] = 1;
        // 当前位置的次对角线方向已经有皇后了
        secondary[row + col] = 1;
    }

    // 移除指定位置上的皇后
    private void removeQueen(int row, int col) {
        // 移除 row 行上的皇后
        queens[row] = 0;
        // 当前位置的列方向没有皇后了
        rows[col] = 0;
        // 当前位置的主对角线方向没有皇后了
        mains[row - col + QUEEN_COUNT - 1] = 0;
        // 当前位置的次对角线方向没有皇后了
        secondary[row + col] = 0;
    }

    /**
     * 将满足条件的皇后位置放入output中
     */
    public void addSolution() {
        System.out.println("********** 第 " +  ++resultCount + " 种放置方法 **********");
        List<String> solution = new ArrayList<String>();
        for (int i = 0; i < QUEEN_COUNT; ++i) {
            int col = queens[i];
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < col; ++j) {
                sb.append(" - ");
            }
            sb.append(" # ");
            for (int j = 0; j < QUEEN_COUNT - col - 1; ++j) {
                sb.append(" - ");
            }
                System.out.println(sb.toString());
        }
    }
}
