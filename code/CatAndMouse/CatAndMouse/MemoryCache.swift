//
//  MemoryCache.swift
//  CatAndMouse
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class MemoryCache: SolutionType {
    required init() {}
    
    var dp : [[[Int]]] = [[[Int]]]()  // Java: int[][][]

    func catMouseGame(_ graph: [[Int]]) -> Int {
        let len = graph.count
        dp = Array(repeating: Array(repeating: Array(repeating: -1, count: len), count: len), count: 2 * len)  // Java: int[2*n][n][n]
        return seach(graph: graph, t: 0, x: 1, y: 2)
    }
    
    func seach(graph: [[Int]], t: Int, x: Int, y: Int) -> Int{
        if t == graph.count * 2 { return 0 }
        if x == y { dp[t][x][y] = 2; return dp[t][x][y] }
        if x == 0 { dp[t][x][y] = 1; return dp[t][x][y] }
        if dp[t][x][y] != -1 { return dp[t][x][y] }
        let who = t % 2
        var flag: Bool
        if who == 0 {  // mouse's turn
            flag = true  // by default, is cat win
            for next in graph[x] {
                let nextVal = seach(graph: graph, t: t + 1, x: next, y: y)
                if nextVal == 1 {
                    dp[t][x][y] = 1; return dp[t][x][y]
                } else if nextVal != 2 {
                    flag = false
                }
            }
            if flag {
                dp[t][x][y] = 2; return dp[t][x][y]
            } else {
                dp[t][x][y] = 0; return dp[t][x][y]
            }
        } else {  // cat's turn
            flag = true  // by default, is mouse win
            for next in graph[y] where next != 0 {
                let nextVal = seach(graph: graph, t: t + 1, x: x, y: next)
                if nextVal == 2 {
                    dp[t][x][y] = 2; return dp[t][x][y]
                } else if nextVal != 1 {
                    flag = false
                }
            }
            if flag {
                dp[t][x][y] = 1; return dp[t][x][y]
            } else {
                dp[t][x][y] = 0; return dp[t][x][y]
            }
        }
    }
}
