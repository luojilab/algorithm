//
//  main.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

print("------------- Dummy Case 1 -------------")
runTestCase(solution: Solution1(), testCase: .case1)

print("\n\n")

print("============================= Case 1 =============================\n")
print("------------- SimplifiedVersion: O(n) -------------")
runTestCase(solution: SimplifiedVersion(), testCase: .case1)
print("------------- Solution 1: Two Stack -------------")
runTestCase(solution: Solution1(), testCase: .case1)
print("------------- Solution 2: One Stack -------------")
runTestCase(solution: Solution2(), testCase: .case1)
print("------------- Solution 3: 差值法 -------------")
runTestCase(solution: Solution3(), testCase: .case1)
print("------------- Solution 4:  -------------")
runTestCase(solution: Solution4(), testCase: .case1)

print("\n\n")

print("============================= Case 2 =============================\n")
print("------------- SimplifiedVersion: O(n) -------------")
runTestCase(solution: SimplifiedVersion(), testCase: .case2)
print("------------- Solution 1: Two Stack -------------")
runTestCase(solution: Solution1(), testCase: .case2)
print("------------- Solution 2: One Stack -------------")
runTestCase(solution: Solution2(), testCase: .case2)
print("------------- Solution 3: 差值法 -------------")
runTestCase(solution: Solution3(), testCase: .case2)
print("------------- Solution 4:  -------------")
runTestCase(solution: Solution4(), testCase: .case2)

print("\n\n")

print("============================= Case 3 =============================\n")
print("------------- SimplifiedVersion: O(n) -------------")
runTestCase(solution: SimplifiedVersion(), testCase: .case3)
print("------------- Solution 1: Two Stack -------------")
runTestCase(solution: Solution1(), testCase: .case3)
print("------------- Solution 2: One Stack -------------")
runTestCase(solution: Solution2(), testCase: .case3)
print("------------- Solution 3: 差值法 -------------")
runTestCase(solution: Solution3(), testCase: .case3)
print("------------- Solution 4:  -------------")
runTestCase(solution: Solution4(), testCase: .case3)
