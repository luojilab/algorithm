//
//  Floyd.swift
//  Floyd-Warshall
//
//  Created by 王锡金 on 2019/9/19.
//  Copyright © 2019 seeking. All rights reserved.
//

import Cocoa

// 定义一个大数值，表示正无穷
let INF = 9999999

// 定义二维数组用于表示邻接矩阵
public struct Array2D<T> {
    public let columns: Int
    public let rows: Int
    fileprivate var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        array = .init(repeating: initialValue, count: rows * columns)
    }
    
    public subscript(column: Int, row: Int) -> T {
        get {
            return array[row * columns + column]
        }
        set {
            array[row * columns + column] = newValue
        }
    }
}

public class Floyd {
    
    public private(set) var graph: Array2D<Int>
    public init(graph: Array2D<Int>) {
        self.graph = graph
        self.resetGraph()
    }
    // 初始化邻接矩阵数据
    public func resetGraph() {
        var row:Int = 0
        while row < self.graph.rows
        {
            var column:Int = 0
            while column < self.graph.columns
            {
                if row == column {
                    self.graph[row,column] = 0
                }
                column += 1
            }
            row += 1
        }
    }
    // 计算所有节点最短路径
    public func allShortestPath() {
        let count = self.graph.rows > self.graph.columns ? self.graph.columns : self.graph.rows
        
        var k:Int = 0
        while k < count
        {
            var row:Int = 0
            while row < count
            {
                var column:Int = 0
                while column < count
                {
                    if self.graph[row,column] > self.graph[row,k] + self.graph[k,column] {
                        self.graph[row,column] = self.graph[row,k] + self.graph[k,column]
                    }
                    column += 1
                }
                row += 1
            }
            k += 1
        }
    }
    // 打印邻接矩阵
    public func printGraph()  {
        print("\n\n\n");
        var row:Int = 0
        while row < self.graph.rows
        {
            var column:Int = 0
            while column < self.graph.columns
            {
                let string:String = String.init(format:"%10d",self.graph[row,column])
                print(string,terminator:"")
                column += 1
            }
            row += 1
            print("\n\n");
        }
        print("\n\n\n");
    }
}
