//
//  Utilites.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

protocol SolutionType {
    func push(_ x: Int)

    func pop()

    func top() -> Int

    func getMin() -> Int
}

func runTestCase(solution: SolutionType, testCase: TestCases.TestCase) {
    var operations = [String]()
    var operationValues = [[Int]]()
    switch testCase {
    case .case1:
        operations = TestCases.Case1.operations
        operationValues = TestCases.Case1.operationValues
    case .case2:
        operations = TestCases.Case2.operations
        operationValues = TestCases.Case2.operationValues
    case .case3:
        operations = TestCases.Case3.operations
        operationValues = TestCases.Case3.operationValues
    }
    

    let start = ProcessInfo.processInfo.systemUptime
    
    var result: String = "["
    for i in 1 ... operations.count - 1 {
        switch operations[i] {
        case "push":
            solution.push(operationValues[i][0])
            result += "null,"
        case "pop":
            solution.pop()
            result += "null,"
        case "top":
            result += "\(solution.top()),"
        case "getMin":
            result += "\(solution.getMin()),"
        default:
            break
        }
    }
    result.removeLast()
    result += "]"

    let end = ProcessInfo.processInfo.systemUptime

    let timeInterval = (end - start) * 1000

    print("结果: \(result)")
    print("用时 (毫秒): \(timeInterval)\n")
}
