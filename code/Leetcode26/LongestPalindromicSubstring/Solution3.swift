//
//  Solution3.swift
//  LongestPalindromicSubstring
//
//  Created by jinjiahui on 2019/10/21.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
/// 解法3:动态规划，优化暴力法
class Solution3 {
    func longestPalindrome(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        let characters = Array(string)
        let length = string.count
        var P = [[Bool]](repeating: [Bool](repeating: false, count: string.count), count: string.count)
        var maxLen = 0
        var maxPal = ""
        for len in 1 ... length {
            for start in 0 ..< length {
                let end = start + len - 1
                if end >= length { break }
                P[start][end] = (characters[start] == characters[end] && (len <= 2 || P[start + 1][end - 1]))
                if P[start][end] && len > maxLen {
                    maxLen = len
                    maxPal = String(characters[start ... end])
                }
            }
        }
        return maxPal
    }
}
