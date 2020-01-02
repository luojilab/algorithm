//
//  Solution2.swift
//  LongestPalindromicSubstring
//
//  Created by jinjiahui on 2019/10/18.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
/// 解法 2: 最长公共子串
/// 选出所有子字符串可能的开始和结束位置，并检验它是不是回文。
class Solution2 {
    func longestCommonSubstring(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        let origin = string
        let reverse = String(string.reversed())
        let length = string.count
        var arr = [[Int]](repeating: [Int](repeating: 0, count: string.count), count: string.count)
        var maxLen = 0
        var maxEndIndex = 0
        for i in 0 ..< length {
            for j in 0 ..< length  {
                let originCharacter = Array(origin)[i]
                let reverseCharacter = Array(reverse)[j]
                if  originCharacter == reverseCharacter {
                    if i == 0 || j == 0 {
                        arr[i][j] = 1
                    } else {
                        arr[i][j] = arr[i - 1][j - 1] + 1
                    }
                }
                if arr[i][j] > maxLen {
                    maxLen = arr[i][j]
                    maxEndIndex = i
                }
            }
        }
        let start = string.index(string.startIndex, offsetBy: maxEndIndex - maxLen + 1)
        let end = string.index(string.startIndex, offsetBy: maxEndIndex)
        return String(string[start...end])
    }
    func longestPalindrome(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        let origin = string
        let reverse = String(string.reversed())
        let length = string.count
        var arr = [[Int]](repeating: [Int](repeating: 0, count: string.count), count: string.count)
        var maxLen = 0
        var maxEndIndex = 0
        for i in 0 ..< length {
            for j in 0 ..< length  {
                let originCharacter = Array(origin)[i]
                let reverseCharacter = Array(reverse)[j]
                if  originCharacter == reverseCharacter {
                    if i == 0 || j == 0 {
                        arr[i][j] = 1
                    } else {
                        arr[i][j] = arr[i - 1][j - 1] + 1
                    }
                }
                if arr[i][j] > maxLen {
                    let beforeRev = length - 1 - j
                    if beforeRev + arr[i][j] - 1 == i {
                        maxLen = arr[i][j]
                        maxEndIndex = i
                    }
                }
            }
        }
        let start = string.index(string.startIndex, offsetBy: maxEndIndex - maxLen + 1)
        let end = string.index(string.startIndex, offsetBy: maxEndIndex)
        return String(string[start...end])
    }
}
