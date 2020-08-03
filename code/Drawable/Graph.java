package Drawable;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by jingchao on 2019-08-22
 * <p>
 * Describe:
 */
public class Graph  {
    private int nodeNum; // 图的节点数
    public static final double INF = Double.MAX_VALUE;
    protected Map<Integer,Map<Integer, Double>> pairs = new HashMap<>();//存储权值


    public Graph(int n) {
        nodeNum = n;
    }

    public void addEdge(int i, int j, int c) {
        try {
            put(i, j, c);
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
        }
    }

    public void addEdges(double[][] triples) {
        for (int i = 0; i < triples.length; ++i) {
            addEdge((int)triples[i][0], (int)triples[i][1], (int) triples[i][2]);
        }
    }

    public double getEdge(int i, int j) {
        if (i == j) {
            return 0;
        }
        try {
            return get(i, j);
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
            return INF;
        }
    }

    // 获取节点 i 的所有边集
    public Map<Integer, Double> getOutEdges(int i) {
        return pairs.get(i);
    }

    /**
     *   打印的邻接矩阵
     */
    public void showSparseMatrix() {
        for (int i = 0; i < nodeNum; ++i) {
            for (int j = 0; j < nodeNum; ++j) {
                String c = getEdge(i, j) < INF ? String.valueOf(getEdge(i, j)) : "0";
                System.out.print(c + " ");
            }
            System.out.println();
        }
    }


    public int getNodeNum(){
        return nodeNum;
    }

    /**
     * 添加矩阵元素
     */
    public void put(int x, int y, double v) throws IndexOutOfBoundsException{
        checkIndex(x,y);
        if(v != INF) {
            Map<Integer,Double> row = pairs.get(x);
            if(null == row) {
                row = new HashMap<>();
            }
            row.put(y, v);
            pairs.put(x, row);
        }
    }

    /**
     * 获取矩阵元素
     */
    public double get(int x, int y) throws IndexOutOfBoundsException{
        checkIndex(x,y);
        Map<Integer,Double> row = pairs.get(x);
        if(row == null) {
            return INF;
        }
        Double v = row.get(y);
        if(v == null) {
            v = INF;
        }
        return v;
    }


    /**
     * 检查是否越界，下标越界则抛出异常
     */
    private void checkIndex(int x, int y) throws IndexOutOfBoundsException {
        if (x > nodeNum || y > nodeNum) {
            throw new IndexOutOfBoundsException(
                    "Index out of bound: (" + x + "," + y + "), " +
                            "(lineNum,columnNum)=(" + nodeNum + "," + nodeNum + ")."
            );
        }
    }
}
