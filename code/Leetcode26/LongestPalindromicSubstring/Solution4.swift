//
//  Solution4.swift
//  LongestPalindromicSubstring
//
//  Created by jinjiahui on 2019/10/21.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
/// 解法4:中心扩展算法
class Solution4 {
    func longestPalindrome(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        var start = 0
        var end = 0
        for i in 0 ..< string.count {
            let len1 = expandAroundCenter(string, left: i, right: i)
            let len2 = expandAroundCenter(string, left: i, right: i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let characters = Array(string)
        return String(characters[start ... end])
    }
    private func expandAroundCenter(_ string: String, left: Int, right: Int) -> Int {
        let characters = Array(string)
        let length = string.count
        var L = left
        var R = right
        while L >= 0 && R < length && characters[L] == characters[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}
