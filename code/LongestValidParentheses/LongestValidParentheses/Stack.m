//
//  Stack.m
//  LongestValidParentheses
//
//  Created by roc鹏 on 2020/5/27.
//  Copyright © 2020 roc鹏. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (nonatomic, strong) NSMutableArray *stackArray;

@end

@implementation Stack

- (void)push:(id)obj {
    [self.stackArray addObject:obj];
}

- (void)popObj {
    if ([self isEmpty]) {
        return;
    }
    return [self.stackArray removeLastObject];
}

- (BOOL)isEmpty {
    return !self.stackArray.count;
}

- (NSInteger)stackLength {
    return self.stackArray.count;
}

- (void)enumerateObjectsFromBottom:(StackBlock)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block ? block(obj) : nil;
    }];
}

- (void)enumerateObjectsFromtop:(StackBlock)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block ? block(obj) : nil;
    }];
}

- (void)enumerateObjectsPopStack:(StackBlock)block {
    __weak typeof(self) weakSelf = self;
    NSUInteger count = self.stackArray.count;
    for (NSUInteger i = count; i > 0; i --) {
        if (block) {
            block(weakSelf.stackArray.lastObject);
            [self.stackArray removeLastObject];
        }
    }
}

- (void)removeAllObjects {
    [self.stackArray removeAllObjects];
}

- (id)peek {
    if ([self isEmpty]) {
        return nil;
    } else {
        return self.stackArray.lastObject;
    }
}

- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}
@end
