package com.example.lib;

public class MyClass {

    public static void main(String[] args) {



        char[][] grid1 = {
                {'1', '1', '1', '1', '0'},
                {'1', '1', '0', '1', '0'},
                {'1', '1', '0', '0', '0'},
                {'0', '0', '0', '0', '0'}};


        char[][] grid2 = {
                {'1', '1', '0', '0', '0'},
                {'1', '1', '0', '0', '0'},
                {'0', '0', '1', '0', '0'},
                {'0', '0', '0', '1', '1'}};

        //深度优先遍历DFS
        System.out.println("深度优先遍历 DFS：");
        Solution solution = new Solution();
        int numIslands1 = solution.numIslands(grid1);
        System.out.println("岛屿数目：" + numIslands1);
        int numIslands2 = solution.numIslands(grid2);
        System.out.println("岛屿数目：" + numIslands2);
        System.out.println("");
        //广度优先遍历 BFS
        System.out.println("广度优先遍历 BFS：");
        Solution solution2 = new Solution();
        int numIslands3 = solution2.numIslands(grid1);
        System.out.println("岛屿数目：" + numIslands3);
        int numIslands4 = solution2.numIslands(grid2);
        System.out.println("岛屿数目：" + numIslands4);
        System.out.println("");

//        char[][] grid3 = {
//                {'1', '0', '1'},
//                {'1', '1', '0'},
//                {'0', '0', '1'},
//                };

        //并集查找
        System.out.println("并集查找:");
        Solution3 solution3 = new Solution3();
        int numIslands5 = solution3.numIslands(grid1);
        System.out.println("岛屿数目：" + numIslands5);
        int numIslands6 = solution3.numIslands(grid2);
        System.out.println("岛屿数目：" + numIslands6);


    }


}