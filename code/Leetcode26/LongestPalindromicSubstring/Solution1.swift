//
//  Solution1.swift
//  LongestPalindromicSubstring
//
//  Created by jinjiahui on 2019/10/18.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
/// 解法 1: 暴力破解
/// 选出所有子字符串可能的开始和结束位置，并检验它是不是回文。
class Solution1 {
    func isPalindromic(_ string: String) -> Bool {
        let midIndex = string.index(string.startIndex, offsetBy: string.count / 2)
        let firstHalf = string[string.startIndex..<midIndex]
        let secondHalf = string[midIndex..<string.endIndex].reversed()
        return !zip(firstHalf, secondHalf).contains(where: { $0.lowercased() != $1.lowercased() })
    }
    func longestPalindrome(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        var result = ""
        var max = 0
        for i in 0 ..< string.count {
            for j in i + 1 ..< string.count {
                let start = string.index(string.startIndex, offsetBy: i)
                let end = string.index(string.startIndex, offsetBy: j)
                let temp = String(string[start...end])
                if isPalindromic(temp), temp.count > max {
                    result = temp
                    max = temp.count
                }
            }
        }
        return result
    }
}
