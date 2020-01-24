//
//  main.swift
//  CatAndMouse
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

print("============================= Case 1 =============================\n")
print("------------- Solution 1: DP -------------")
runTestCase(solution: MemoryCache.self, testCase: graph1)
print("------------- Solution 2: BFS -------------")
runTestCase(solution: DFS.self, testCase: graph1)
print("------------- Solution 3: DFS -------------")
runTestCase(solution: BFS.self, testCase: graph1)


print("============================= Case 2 =============================\n")
print("------------- Solution 1: DP -------------")
runTestCase(solution: MemoryCache.self, testCase: graph2)
print("------------- Solution 2: BFS -------------")
runTestCase(solution: DFS.self, testCase: graph2)
print("------------- Solution 3: DFS -------------")
runTestCase(solution: BFS.self, testCase: graph2)


print("============================= Case 3 =============================\n")
print("------------- Solution 1: DP -------------")
runTestCase(solution: MemoryCache.self, testCase: graph3)
print("------------- Solution 2: BFS -------------")
runTestCase(solution: DFS.self, testCase: graph3)
print("------------- Solution 3: DFS -------------")
runTestCase(solution: BFS.self, testCase: graph3)

print("\n\n")
