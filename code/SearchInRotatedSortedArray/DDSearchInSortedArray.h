//
//  DDSorted.h
//  SearchInRotatedSortedArray
//
//  Created by roc鹏 on 2019/11/18.
//  Copyright © 2019 roc鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDSearchInSortedArray : NSObject

//方案1
+ (NSInteger)searchInSortedArray1:(NSArray<NSNumber *> *)array target:(NSInteger)target;

+ (NSInteger)searchInSortedArray2:(NSArray<NSNumber *> *)array target:(NSInteger)target;

//方案2
+ (NSInteger)searchInSortedArray3:(NSArray<NSNumber *> *)array target:(NSInteger)target;

//方案3
+ (NSInteger)searchInSortedArray4:(NSArray<NSNumber *> *)array target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END
