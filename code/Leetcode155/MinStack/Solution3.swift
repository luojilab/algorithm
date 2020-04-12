//
//  Solution2.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

class Solution3: SolutionType {
    
    var min: Int = Int.max
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        if stack.isEmpty {
            min = x
            stack.append(x - min)
        } else {
            stack.append(x - min)
            if (x < min) {
                min = x
            }
        }
    }

    func pop() {
        let pop = stack.popLast()!
        if (pop < 0) {
            min = min - pop
        }
    }

    func top() -> Int {
        let top = stack.last!
        if (top < 0) {
            return min
        } else {
            return top + min
        }
    }

    func getMin() -> Int {
        return min
    }
}
