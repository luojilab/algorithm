//
//  main.swift
//  Dijkstra
//
//  Created by jinjiahui on 2019/8/19.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
// 定义节点
let A = Vertex("A")
let B = Vertex("B")
let C = Vertex("C")
let D = Vertex("D")
let E = Vertex("E")

// 定义边
let edges = [
    Edge(from: A, to: B, cost: 6),
    Edge(from: A, to: D, cost: 1),
    Edge(from: D, to: B, cost: 2),
    Edge(from: D, to: E, cost: 1),
    Edge(from: B, to: C, cost: 5),
    Edge(from: B, to: E, cost: 2),
    Edge(from: E, to: C, cost: 5)
]

// 图
let G = Graph(edges: edges)

// 最短路径
print(G.shortestPath(from: A, to: B))
print(G.shortestPath(from: A, to: C))
print(G.shortestPath(from: A, to: D))
print(G.shortestPath(from: A, to: E))
