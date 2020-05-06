//
//  SimplifiedVersion.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class SimplifiedVersion: SolutionType {
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        stack.append(x)  // O(1)
    }

    func pop() {
        _ = stack.popLast()  // O(1)
    }

    func top() -> Int {
        return stack.last!  // O(1)
    }

    func getMin() -> Int {
        return stack.min()!  // O(n)
    }
}
