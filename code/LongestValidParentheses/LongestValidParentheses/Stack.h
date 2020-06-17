//
//  Stack.h
//  LongestValidParentheses
//
//  Created by roc鹏 on 2020/5/27.
//  Copyright © 2020 roc鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^StackBlock)(id obj);

@interface Stack : NSObject

/**
 入栈
 @param obj 指定入栈对象
 */
- (void)push:(id)obj;

/**
 出栈
 */
- (void)popObj;

/**
 是否为空
 */
- (BOOL)isEmpty;

/**
 栈的长度
 */
- (NSInteger)stackLength;

/**
 从栈底开始遍历
 @param block 回调遍历的结果
 */
- (void)enumerateObjectsFromBottom:(StackBlock)block;

/**
 从顶部开始遍历
 */
- (void)enumerateObjectsFromtop:(StackBlock)block;

/**
 所有元素出栈，一边出栈一边返回元素
 */
- (void)enumerateObjectsPopStack:(StackBlock)block;

/**
 清空
 */
- (void)removeAllObjects;

/**
 返回栈顶元素
 */
- (id)peek;

@end

NS_ASSUME_NONNULL_END
