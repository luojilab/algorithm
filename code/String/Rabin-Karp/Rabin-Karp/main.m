//
//  main.m
//  Rabin-Karp
//
//  Created by 王锡金 on 2019/7/19.
//  Copyright © 2019 seeking. All rights reserved.
//

#import <Foundation/Foundation.h>

#define q 11

int hashOfString(NSString *text)
{
    NSUInteger scale = 1;
    NSUInteger sum = 0;
    for (NSInteger i = text.length - 1; i >= 0; i--)
    {
        if (i < text.length - 1) {
            scale *= 10;
        }
        NSString *c = [text substringWithRange:NSMakeRange(i, 1)];
        sum += ([c integerValue] * scale);
    }
    return sum % q;
}

void search(NSString *pattern, NSString *text)
{
    NSUInteger lengthOfPattern = pattern.length;
    NSUInteger lengthOfText = text.length;
    NSUInteger i, j;
    NSUInteger hashOfPattern = 0;  // 模式串的哈希值
    NSUInteger hashOfText = 0;     // 文本串的哈希值
    
    // 计算模式串的哈希值和文本串中第一个子串的哈希值
    hashOfPattern = hashOfString(pattern);
    hashOfText = hashOfString([text substringToIndex:0]);
    
    // 在文本串上自动窗口进行匹配
    for (i = 0; i <= lengthOfText - lengthOfPattern; i++)
    {
        // 比较文本串当前窗口的子串的哈希值是否与模式串的哈希值相等
        if ( hashOfPattern == hashOfText )
        {
            /* 使用朴素算法进行比较 */
            for (j = 0; j < lengthOfPattern; j++)
            {
                if ([text substringWithRange:NSMakeRange(i+j, 1)] != [pattern substringWithRange:NSMakeRange(j, 1)])
                    break;
            }
            // 匹配成功
            if (j == lengthOfPattern)
                printf("Pattern found at index %ld \n", i);
        }
        
        // 文本串当前窗口的子串的哈希值与模式串的哈希值不相等，滑动窗口，重新计算新子串的哈希值
        if ( i < lengthOfText - lengthOfPattern )
        {
            hashOfText = hashOfString([text substringWithRange:NSMakeRange(i + 1, lengthOfPattern)]);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *text = @"31415926535";
        NSString *pattern = @"26";
        search(pattern, text);

    }
    return 0;
}
