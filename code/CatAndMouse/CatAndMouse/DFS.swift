//
//  DFS.swift
//  CatAndMouse
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class DFS: SolutionType {
    required init() {}
    
    func catMouseGame(_ graph: [[Int]]) -> Int {
        let len = graph.count
        var status: [[[Int]]] = Array(repeating: Array(repeating: [0, 0], count: len), count: len)
        var queue = Queue<State>()

        // 初始化
        for j in 1 ..< len {
            status[0][j][0] = 1
            status[0][j][1] = 1
            queue.enqueue(State(i: 0, j: j, k: 0, val: 1))
            queue.enqueue(State(i: 0, j: j, k: 1, val: 1))
        }

        for i in 1 ..< len {
            status[i][i][0] = 2
            status[i][i][1] = 2
            queue.enqueue(State(i: i, j: i, k: 0, val: 2))
            queue.enqueue(State(i: i, j: i, k: 1, val: 2))
        }

        // 遍历 queue

        while !queue.isEmpty {
            let s = queue.dequeue()!
            let (i, j, k, val) = (s.i, s.j, s.k, s.val)
            if k == 0 { // 1. 此步轮到鼠行动
                if val == 1 { // 1.1 此步鼠胜
                    for pre in graph[j] {
                        var mouseWin = true
                        for preNext in graph[pre] {
                            if status[i][preNext][0] != 1 && preNext != 0 {
                                mouseWin = false
                                break
                            }
                        }
                        if mouseWin && status[i][pre][1] == 0 && pre != 0 {
                            status[i][pre][1] = 1
                            queue.enqueue(State(i: i, j: pre, k: 1, val: 1))
                            if debug { print("Set location (\(i), \(pre), \(k)) as \(val)") }
                        }
                    }
                } else { // 1.2 此步猫胜
                    for pre in graph[j] {
                        if status[i][pre][1] == 0 && pre != 0 {
                            status[i][pre][1] = 2
                            queue.enqueue(State(i: i, j: pre, k: 1, val: 2))
                            if debug { print("Set location (\(i), \(pre), \(k)) as \(val)")}
                        }
                    }
                }
            } else { // 2. 此步轮到猫行动
                if val == 1 { // 2.1 此步鼠胜
                    for pre in graph[i] {
                        if status[pre][j][0] == 0 && j != 0 {
                            status[pre][j][0] = 1
                            queue.enqueue(State(i: pre, j: j, k: 0, val: 1))
                            if debug { print("Set location (\(pre), \(j), \(k)) as \(val)") }
                        }
                    }
                } else { // 2.2 此步猫胜
                    for pre in graph[i] {
                        var catWin = true
                        for preNext in graph[pre] {
                            if status[preNext][j][1] != 2 && j != 0 {
                                catWin = false
                                break
                            }
                        }
                        if catWin && status[pre][j][0] == 0 && j != 0 {
                            status[pre][j][0] = 2
                            queue.enqueue(State(i: pre, j: j, k: 0, val: 2))
                            if debug { print("Set location (\(pre), \(j), \(k)) as \(val)") }
                        }
                    }
                }
            }
        }

        return status[1][2][0]
    }
}
