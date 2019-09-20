package Drawable;


import java.util.Map;

/**
 * Created by jingchao on 2019-08-22
 * <p>
 * Describe:
 */
public class DrawableShortPath {

    private int origin;
    private int[] preNodes;
    private double[] distances;
    private boolean hasNegativeLoop;//是否有负路径
    private static final int NODENUM = 6;//有多少个点
    private static final int ORIGIN = 0;//起源节点

    private static final double[][] THREEYUAN = new double[][]{
            {0,1,2},
            {0,2,1},
            {1,3,3},
            {2,1,1},
            {2,4,1},
            {3,5,7},
            {3,2,1},
            {4,5,3},
            {5,4,-4}
    };


    public DrawableShortPath(int o, double[] dis, int[] pre, boolean has) {
        origin = o;
        preNodes = pre;
        distances = dis;
        hasNegativeLoop = has;
    }


    public static void main(String[] args) {
        Graph graph = new Graph(NODENUM);
        graph.addEdges(THREEYUAN);
        System.out.println("稀疏矩阵为：");
        graph.showSparseMatrix();

        DrawableShortPath sp = DrawableShortPath.BellmanFord(graph, ORIGIN);
        System.out.println();

        sp.analyse();

    }

    private static DrawableShortPath BellmanFord(Graph g, int origin) {
        int nodeNum = g.getNodeNum();
        boolean hasNLoop = false;
        // 初始化前向节点
        int pre[] = new int[nodeNum];
        pre[origin] = origin;
        // 初始化距离向量 设置所有的最短路径为int 最大值
        double[] distances = new double[nodeNum];
        for (int i = 0; i < nodeNum; ++i) {
            distances[i] = Graph.INF;
        }
        //设置源点的最短路径为0
        distances[origin] = 0;

        int iteration = nodeNum;
        while (iteration-- > 0) {
            boolean update = false;
            // 遍历所有的边
            for (int i = 0; i < nodeNum; ++i) {
                //获取节点 i 的所有边集
                Map<Integer, Double> outEdges = g.getOutEdges(i);
                if (outEdges != null) {
                    for (Integer j : outEdges.keySet()) {
                        // 如果节点 j 可以使得距离向量更小，把 j 加入 V
                        if (distances[j] > distances[i] + outEdges.get(j)) {
                            //用于优化 判断是够有到当前节点的边
                            update = true;
                            //如果当前iteration ==0 还没有跳出循环说明当前点的最短路径上有闭环且负权大于另外的一条边的权
                            if (iteration == 0) {
                                hasNLoop = true;
                                break;
                            }
                            //更新当前点的最短权值
                            distances[j] = distances[i] + outEdges.get(j);
                            //更新当前点的前驱节点
                            pre[j] = i;
                        }
                    }
                }
            }
            // 如果这次遍历没有任何更新，那么下一次也不会更新，提前退出循环
            if (!update) {
                break;
            }
        }
        return new DrawableShortPath(origin, distances, pre, hasNLoop);
    }

    private void analyse() {
        System.out.println("最短路径有环路且循环的值为负权: " + hasNegativeLoop);
        if(!hasNegativeLoop){
            for (int i = 0; i < distances.length; ++i) {
                String c = distances[i] < Graph.INF ? String.valueOf(distances[i]) : "无穷大";
                System.out.println("从起源点" + origin + " 到目标点" + i + "的最短路径为 " + c);
                if (distances[i] < Graph.INF) {
                    int j = i;
                    while (j != origin) {
                        System.out.print(j + " -> ");
                        j = preNodes[j];
                    }
                    System.out.println(j);
                }
            }

        }

    }

}
