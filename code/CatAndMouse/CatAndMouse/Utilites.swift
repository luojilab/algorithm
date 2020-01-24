//
//  Utilites.swift
//  CatAndMouse
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation

let debug: Bool = false

protocol SolutionType {
    func catMouseGame(_ graph: [[Int]]) -> Int
    init()
}

func runTestCase(solution: SolutionType.Type, testCase: [[Int]]) {
    let solution = solution.init()

    let start = ProcessInfo.processInfo.systemUptime

    let result = solution.catMouseGame(testCase)

    let end = ProcessInfo.processInfo.systemUptime

    let timeInterval = (end - start) * 1000

    print("结果: \(result)")
    print("用时 (毫秒): \(timeInterval)\n")
}

struct State {
    var i, j, k, val: Int
}

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0

    public var isEmpty: Bool {
        return count == 0
    }

    public var count: Int {
        return array.count - head
    }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }

        array[head] = nil
        head += 1

        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }

        return element
    }

    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

public struct Stack<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop() -> T? {
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }
}
