//
//  main.swift
//  LongestPalindromicSubstring
//
//  Created by jinjiahui on 2019/10/18.
//  Copyright © 2019 jinjiahui. All rights reserved.
//

import Foundation
let string1 = "asd4123dcabacd321dfsdf"
let string2 = "abacdfgdcaba"
example("Solution1") {
    let solution = Solution1()
//    print(solution.isPalindromic("123dcabacd321"))
//    print(solution.isPalindromic("abacdfgdcaba")))
    print(solution.longestPalindrome(string1))
    print(solution.longestPalindrome(string2))
}

example("Solution2") {
    let solution = Solution2()
//    print(solution.longestCommonSubstring("caba"))
//    print(solution.longestCommonSubstring("abc435cba"))
    print(solution.longestPalindrome(string1))
    print(solution.longestPalindrome(string2))
}

example("Solution3") {
    let solution = Solution3()
    print(solution.longestPalindrome(string1))
    print(solution.longestPalindrome(string2))
}

example("Solution4") {
    let solution = Solution4()
    print(solution.longestPalindrome(string1))
    print(solution.longestPalindrome(string2))
}

