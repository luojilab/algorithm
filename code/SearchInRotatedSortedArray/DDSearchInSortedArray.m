//
//  DDSorted.m
//  SearchInRotatedSortedArray
//
//  Created by roc鹏 on 2019/11/18.
//  Copyright © 2019 roc鹏. All rights reserved.
//

#import "DDSearchInSortedArray.h"

@implementation DDSearchInSortedArray

//方案1
+ (NSInteger)searchInSortedArray1:(NSArray<NSNumber *> *)array target:(NSInteger)target{
    if ([array count] == 0) {
        return -1;
    }
    NSInteger start = 0;
    NSInteger end = [array count] - 1;
    
    //写了个算法获取最小值
    //当然也可以换成直接操作start和end，更快捷。
    NSInteger minNumber = [DDSearchInSortedArray findMinNumber:array];
    NSInteger minIndex = [array indexOfObject:@(minNumber)];
    if (minIndex == NSNotFound) {
        return -1;
    }
    //判断target，是在最小值左边的有序数组还是右边
    if (array[minIndex].integerValue <= target && target <= array[end].integerValue){
        start = minIndex;
    }else{
        end = minIndex;
    }
    //接下来就可以针对target所在的一边，进行二分查找！
    while (start <= end) {
        NSInteger mid = start + (end - start) / 2;
        //如果中间刚好是查询的值
        if (array[mid].integerValue == target) {
            return mid;
        }else if (array[mid].integerValue > target) {
            end = mid - 1;
        }else{
            start = mid + 1;
        }
    }
    return -1;
}

+ (NSInteger)searchInSortedArray2:(NSArray<NSNumber *> *)array target:(NSInteger)target{
    if ([array count] == 0) {
        return -1;
    }
    NSInteger start = 0;
    NSInteger end = [array count] - 1;
    while (start <= end) {
        NSInteger mid = start + (end - start) / 2;
        NSInteger num = array[mid].integerValue;
        //nums [ mid ] 和 target 在同一段
        if ((array[mid].integerValue < array[0].integerValue) == (target < array[0].integerValue)) {
            num = array[mid].integerValue;
        //nums [ mid ] 和 target 不在同一段，同时还要考虑下变成 -inf 还是 inf。
        } else {
            num = target < array[0].integerValue ? NSIntegerMin : NSIntegerMax;
        }
        if (num < target) {
            start = mid + 1;
        }else if (num > target) {
            end = mid - 1;
        }else {
            return mid;
        }
    }
    return -1;
}

//方案2
+ (NSInteger)searchInSortedArray3:(NSArray<NSNumber *> *)array target:(NSInteger)target{
    if ([array count] == 0) {
        return -1;
    }
    NSInteger start = 0;
    NSInteger end = [array count] - 1;
    while (start <= end) {
        NSInteger mid = (start + end) / 2;
        if (target == array[mid].integerValue) {
            return mid;
        }
        //左半段是有序的
        if (array[start].integerValue <= array[mid].integerValue) {
            //target 在这段里
            if (target >= array[start].integerValue && target < array[mid].integerValue) {
                end = mid - 1;
            } else {
                start = mid + 1;
            }
            //右半段是有序的
        } else {
            if (target > array[mid].integerValue && target <= array[end].integerValue) {
                start = mid + 1;
            } else {
                end = mid - 1;
            }
        }
        
    }
    return -1;
}

//方案3
+ (NSInteger)searchInSortedArray4:(NSArray<NSNumber *> *)array target:(NSInteger)target{
    if ([array count] == 0) {
        return -1;
    }
    NSInteger location = 0;
    NSInteger length = [array count] - 1;
    while (location < length) {
        NSInteger middle = (location + length) / 2;
        if ((array[0].integerValue > target) ^ (array[0].integerValue > array[middle].integerValue) ^ (target > array[middle].integerValue)){
            location = middle + 1;
        }else {
            length = middle;
        }
    }
    return (location == length && (array[location].integerValue == target)) ? location : -1;
}

#pragma mark - private Methods

+ (NSInteger)findMinNumber:(NSArray<NSNumber *> *)array{
    if (array == nil || [array count] == 0) {
        return NSIntegerMin;
    }
    if ([array count] == 1) {
        return [[array firstObject] integerValue];
    }
    // initializing left and right pointers.
    NSInteger left = 0;
    NSInteger right = [array count] - 1;
    // if the last element is greater than the first element then there is no rotation.
    // e.g. 1 < 2 < 3 < 4 < 5 < 7. Already sorted array.
    // Hence the smallest element is first element. A[0]
    if (array[right].integerValue > array[0].integerValue) {
        return array[0].integerValue;
    }
    // Binary search way
    while (right >= left) {
        // Find the mid element
        NSInteger mid = left + (right - left) / 2;
        // if the mid element is greater than its next element then mid+1 element is the smallest
        // This point would be the point of change. From higher to lower value.
        if (array[mid].integerValue > array[mid + 1].integerValue) {
            return array[mid + 1].integerValue;
        }
        // if the mid element is lesser than its previous element then mid element is the smallest
        if (array[mid - 1].integerValue > array[mid].integerValue) {
            return array[mid].integerValue;
        }
        // if the mid elements value is greater than the 0th element this means
        // the least value is still somewhere to the right as we are still dealing with elements
        // greater than nums[0]
        if (array[mid].integerValue > array[0].integerValue) {
            left = mid + 1;
        } else {
            // if nums[0] is greater than the mid value then this means the smallest value is somewhere to
            // the left
            right = mid - 1;
        }
    }
    return -1;
}


@end
