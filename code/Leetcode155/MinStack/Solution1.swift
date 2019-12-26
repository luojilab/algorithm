//
//  Solution1.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class Solution1: SolutionType {
    var stack = [Int]()
    var minStack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
    }

    func pop() {
        if stack.popLast()! == minStack.last! {
            _ = minStack.popLast()
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
