//
//  main.m
//  LongestValidParentheses
//
//  Created by roc鹏 on 2020/5/27.
//  Copyright © 2020 roc鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LongestValidParentheses.h"

static NSString *kStringParentheses1 = @"()()()";
static NSString *kStringParentheses2 = @"((()))";
static NSString *kStringParentheses3 = @"(((((()))";
static NSString *kStringParentheses4 = @"(()(((())))(((()()()())))))((((()()())()(()((((((((()))))))))))))))))))))))))";
static NSString *kStringParentheses5 = @"()()))(((((())((()";
static NSString *kStringParentheses6 = @")))))((((())))";
static NSString *kStringParentheses7 = @"()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()((((()))))((((()))))";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *parentheses = kStringParentheses3;
        
        CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
        NSLog(@"字串长度 = %ld \r\n",[parentheses length]);
        
        NSLog(@"1：暴力解法 = %ld",[LongestValidParentheses violenceMethod:parentheses]);
        NSLog(@"1：暴力解法耗时 = %.5f\r\n",CFAbsoluteTimeGetCurrent() - time1);
        
        CFAbsoluteTime time2 = CFAbsoluteTimeGetCurrent();
        NSLog(@"2：动态规划解法 = %ld",[LongestValidParentheses dynamicProgrammingMethod:parentheses]);
        NSLog(@"2：动态规划解耗时 = %.5f\r\n",CFAbsoluteTimeGetCurrent() - time2);
        
        CFAbsoluteTime time5 = CFAbsoluteTimeGetCurrent();
        NSLog(@"5：动态规划解法 = %ld",[LongestValidParentheses dynamicProgrammingMethodTwo:parentheses]);
        NSLog(@"5：动态规划解耗时 = %.5f\r\n",CFAbsoluteTimeGetCurrent() - time5);
        
        CFAbsoluteTime time3 = CFAbsoluteTimeGetCurrent();
        NSLog(@"3：栈解法 = %ld",[LongestValidParentheses stackMethod:parentheses]);
        NSLog(@"3：栈解法耗时 = %.5f\r\n",CFAbsoluteTimeGetCurrent() - time3);
        
        CFAbsoluteTime time4 = CFAbsoluteTimeGetCurrent();
        NSLog(@"4：左右扫描解法 = %ld",[LongestValidParentheses leftAndRightScanningMethod:parentheses]);
        NSLog(@"4：左右扫描法解耗时 = %.5f\r\n",CFAbsoluteTimeGetCurrent() - time4);
    }
    return 0;
}

