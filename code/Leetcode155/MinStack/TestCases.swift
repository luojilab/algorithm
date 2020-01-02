//
//  TestCases.swift
//  MinStack
//
//  Created by Banghua Zhao on 2019/12/23.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import Foundation


struct TestCases {
    
    enum TestCase {
        case case1
        case case2
        case case3
    }
    
    struct Case1 {
        static let operations = ["MinStack","push","push","push","getMin","pop","top","getMin"]
        static let operationValues = [[],[-2],[0],[-3],[],[],[],[]]
    }
    
    struct Case2 {
        static let operations = ["MinStack","push","push","push","getMin","pop","getMin","push","push","push","getMin","pop","getMin","push","push","push","getMin","pop","getMin","push","push","push","getMin","pop","getMin"]
        static let operationValues = [[],[-1],[1],[0],[],[],[],[-1],[1],[0],[],[],[],[-1],[1],[0],[],[],[],[-1],[1],[0],[],[],[]]
    }
    
    struct Case3 {
        static let operations = ["MinStack","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","push","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin","getMin"]
        static let operationValues = [[],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[0],[1],[0],[-4],[6],[-3],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    }
}
