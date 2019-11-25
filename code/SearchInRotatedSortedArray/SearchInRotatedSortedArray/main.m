//
//  main.m
//  SearchInRotatedSortedArray
//
//  Created by roc鹏 on 2019/11/18.
//  Copyright © 2019 roc鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDSearchInSortedArray.h"

static NSInteger arrayLength = 50000;
static NSInteger arrayStep = 6;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@" -----------------  begin -------------------");

        //Init Sorted Array
        NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:arrayLength];
        for (NSInteger i = 0; i <= arrayLength; i++) {
            [tmpArray addObject:@(i * arrayStep)];
        }
        NSInteger tmpArrayLength = [tmpArray count];
        
        //random index Rotated
        NSInteger rotatedRandomIndex = arc4random() % arrayLength;
        NSArray *leftArray = [tmpArray subarrayWithRange:NSMakeRange(0, rotatedRandomIndex)];
        NSArray *rightArray = [tmpArray subarrayWithRange:NSMakeRange(rotatedRandomIndex, (tmpArrayLength - rotatedRandomIndex - 1))];
        
        //Rotated array
        NSMutableArray *reversedArray = [[NSMutableArray alloc] initWithCapacity:arrayLength];
        [reversedArray addObjectsFromArray:rightArray];
        [reversedArray addObjectsFromArray:leftArray];
        
        NSLog(@"reversedArray = %@",[reversedArray componentsJoinedByString:@","]);
        
        //random value
        NSInteger targetRandomIndex = arc4random() % arrayLength;
        NSNumber *randomValue = [reversedArray objectAtIndex:targetRandomIndex];
        NSLog(@"randomValue = %@",randomValue);
        
        //search in sorted array
        NSLog(@" ----------------- start ------------------");
        CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
        NSInteger index1 = [DDSearchInSortedArray searchInSortedArray1:reversedArray target:[randomValue integerValue]];
        NSLog(@"-- index1 = %ld -- \r\n-- time cost = %.15f --",(long)index1 , (CFAbsoluteTimeGetCurrent() - time1));

        time1 = CFAbsoluteTimeGetCurrent();
        NSInteger index2 = [DDSearchInSortedArray searchInSortedArray2:reversedArray target:[randomValue integerValue]];
        NSLog(@"-- index2 = %ld -- \r\n-- time cost = %.15f --",(long)index2 , (CFAbsoluteTimeGetCurrent() - time1));

        time1 = CFAbsoluteTimeGetCurrent();
        NSInteger index3 = [DDSearchInSortedArray searchInSortedArray3:reversedArray target:[randomValue integerValue]];
        NSLog(@"-- index3 = %ld -- \r\n-- time cost = %.15f --",(long)index3 , (CFAbsoluteTimeGetCurrent() - time1));

        time1 = CFAbsoluteTimeGetCurrent();
        NSInteger index4 = [DDSearchInSortedArray searchInSortedArray4:reversedArray target:[randomValue integerValue]];
        NSLog(@"-- index4 = %ld -- \r\n-- time cost = %.15f --",(long)index4 , (CFAbsoluteTimeGetCurrent() - time1));

        NSLog(@" -----------------  end -------------------");

    }
    return 0;
}



