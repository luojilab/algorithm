//
//  Solution4.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

struct Node {
    let value: Int
    let min: Int
}

class Solution4: SolutionType {
    var stack = [Node]()

    init() {}

    func push(_ x: Int) {
        let node = Node(value: x, min: min(stack.last?.min ?? x, x))
        stack.append(node)
    }

    func pop() {
        _ = stack.popLast()
    }

    func top() -> Int {
        return stack.last!.value
    }

    func getMin() -> Int {
        return stack.last!.min
    }
}
