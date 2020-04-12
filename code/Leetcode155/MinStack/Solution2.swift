//
//  Solution2.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class Solution2: SolutionType {
    
    var min: Int = Int.max
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        if (x <= min) {
            stack.append(min)
            min = x
        }
        stack.append(x)
    }

    func pop() {
        if stack.popLast()! == min {
            min = stack.popLast()!
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return min
    }
}
