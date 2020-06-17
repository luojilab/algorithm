//
//  LongestValidParentheses.m
//  LongestValidParentheses
//
//  Created by roc鹏 on 2020/5/27.
//  Copyright © 2020 roc鹏. All rights reserved.
//

#import "LongestValidParentheses.h"
#import "Stack.h"

@implementation LongestValidParentheses


/// 判断括号是否有效
/// @param str 目标字符串
+ (BOOL)isVailed:(NSString *)str {
    Stack *stack = [[Stack alloc] init];
    for (NSInteger i = 0; i < [str length]; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"("]) {
            [stack push:@"("];
        } else if (![stack isEmpty] && [[stack peek] isEqualToString:@"("]) {
            [stack popObj];
        } else {
            return NO;
        }
    }
    return [stack isEmpty];
}


/// 暴力解法
/// @param str 目标字符串
+ (NSInteger)violenceMethod:(NSString *)str {
    NSInteger maxLength = 0;
    for (NSInteger i = 0; i < [str length]; i++) {
        for (NSInteger j = i + 2; j <= [str length]; j+=2) {
            NSString *subString = [str substringWithRange:NSMakeRange(i, j - i)];
            if ([LongestValidParentheses isVailed:subString]) {
                maxLength = MAX(maxLength, j - i);
            }
            
        }
    }
    return maxLength;
}

/// 动态规划
/// @param str 字符串
+ (NSInteger)dynamicProgrammingMethodTwo:(NSString *)str {
    NSInteger length = [str length];
    NSInteger maxLength = 0;
    
    //二维数组记录
    //valid[i][j]表示s[i]...s[j]是否是有效字串
    NSMutableArray *valid = [[NSMutableArray alloc] init];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i <= length; i++) {
        [array addObject:@(NO)];
    }
    [valid addObject:array];
    [valid addObject:array];

    for (NSInteger i = 0 ; i + 1 < length; i++) {
        NSString *temp1 = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *temp2 = [str substringWithRange:NSMakeRange(i + 1, 1)];
        if ([temp1 isEqualToString:@"("] && [temp2 isEqualToString:@"("]) {
            valid[i][i+1] = @(YES);
            maxLength = 2;
        }
    }
    for (NSInteger k = 3; k < length; k = k + 2) {
        for (NSInteger i = 0 ; i + k < length; i++) {
            for (NSInteger j = i + 1 ; j + 1 < i + k; j = j + 2) {
                if (valid[i][j] && valid[j+1][i+k]) {
                    valid[i][i+k] = @(YES);
                    maxLength = k + 1;
                    break;
                }
            }
        }
    }
    
    return maxLength;
    
}



/// 动态规划
/// @param str 字符串
+ (NSInteger)dynamicProgrammingMethod:(NSString *)str {
    NSInteger maxLength = 0;
    NSMutableArray *dpArray = [[NSMutableArray alloc] initWithCapacity:str.length];
    //dp数组先填充补0
    for (NSInteger i = 0; i < [str length]; i++) {
        [dpArray addObject:@(0)];
    }
    //一次遍历
    for (NSInteger i = 1; i < [str length]; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        //判断右括号
        if ([temp isEqualToString:@")"]) {
            NSString *lastTemp = [str substringWithRange:NSMakeRange(i - 1, 1)];
            //右括号前边是左括号
            if ([lastTemp isEqualToString:@"("]) {
                NSInteger length = i >= 2 ? [dpArray[i - 2] integerValue] : 0;
                length = length + 2;
                dpArray[i] = [NSNumber numberWithInteger:length];
                //右括号前边是右括号，并且除去前边的合法序列的前边是左括号
            } else if (i - [dpArray[i - 1] integerValue] - 1 >= 0) {
                NSString *lastlastTemp = [str substringWithRange:NSMakeRange(i - [dpArray[i - 1] integerValue] - 1, 1)];
                if ([lastlastTemp isEqualToString:@"("]) {
                    NSInteger length = (i - [dpArray[i - 1] integerValue] - 2) >= 0 ? [dpArray[i - [dpArray[i - 1] integerValue] - 2] integerValue] : 0;
                    length = length + [dpArray[i - 1] integerValue] + 2;
                    dpArray[i] = [NSNumber numberWithInteger:length];
                }
            }
        }
        maxLength = MAX(maxLength, [dpArray[i] integerValue]);
    }
    return maxLength;
}


/// 栈解法
/// @param str 目标字符串
+ (NSInteger)stackMethod:(NSString *)str{
    NSInteger maxLength = 0;
    Stack *stack = [[Stack alloc] init];
    [stack push:@(-1)];
    for (NSInteger i = 0; i < [str length]; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"("]) {
            [stack push:@(i)];
        } else {
            [stack popObj];
            if ([stack isEmpty]) {
                [stack push:@(i)];
            } else {
                maxLength = MAX(maxLength, i - [[stack peek] integerValue]);
            }
        }
    }
    return maxLength;
}


/// 左右扫描解法
/// @param str 目标字符串
+ (NSInteger)leftAndRightScanningMethod:(NSString *)str{
    NSInteger left = 0;
    NSInteger right = 0;
    NSInteger maxLength = 0;
    //从左到右扫描
    for (NSInteger i = 0; i < [str length]; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"("]) {
            left++;
        } else {
            right++;
        }
        if (left == right) {
            maxLength = MAX(maxLength , 2 * left);
        } else if (right > left){
            left = 0;
            right = 0;
        }
    }
    left = 0;
    right = 0;
    //从右到左扫描
    for (NSInteger i = [str length] - 1; i >= 0; i--) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"("]) {
            left++;
        } else {
            right++;
        }
        if (left == right) {
            maxLength = MAX(maxLength , 2 * left);
        } else if (left > right){
            left = 0;
            right = 0;
        }
    }
    return maxLength;
}

@end
