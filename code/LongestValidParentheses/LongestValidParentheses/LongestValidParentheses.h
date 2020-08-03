//
//  LongestValidParentheses.h
//  LongestValidParentheses
//
//  Created by roc鹏 on 2020/5/27.
//  Copyright © 2020 roc鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LongestValidParentheses : NSObject

+ (NSInteger)violenceMethod:(NSString *)str;

+ (NSInteger)dynamicProgrammingMethod:(NSString *)str;
+ (NSInteger)dynamicProgrammingMethodTwo:(NSString *)str;

+ (NSInteger)stackMethod:(NSString *)str;

+ (NSInteger)leftAndRightScanningMethod:(NSString *)str;

@end


NS_ASSUME_NONNULL_END
