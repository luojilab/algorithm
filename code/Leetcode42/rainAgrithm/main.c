//
//  main.c
//  rainAlgorithm
//
//  Created by qz on 2020/3/18.
//  Copyright © 2020 luojilab. All rights reserved.
//

#include <stdio.h>

#define     MIN(a, b)   (((a) < (b)) ? (a) : (b))
#define     MAX(a, b)   (((a) > (b)) ? (a) : (b))

int solution1(int* heightArray, int size) {
    int water = 0;
    for (int i = 1; i < size - 1; i++) {
        int max_left = 0, max_right = 0;
        for (int j = i; j >= 0; j--) {
            max_left = MAX(max_left, heightArray[j]);
        }
        for (int j = i; j < size; j++) {
            max_right = MAX(max_right, heightArray[j]);
        }
        water += MIN(max_left, max_right) - heightArray[i];
    }
    return water;
}

int solution2(int* heightArray, int size) {
    int left[size], right[size];
    for (int i = 1; i < size; i++) {
        left[i] = MAX(left[i - 1], heightArray[i - 1]);
    }
    for (int i = size - 2; i >= 0; i--) {
        right[i] = MAX(right[i + 1], heightArray[i + 1]);
    }
    int water = 0;
    for (int i = 1; i < size - 1; i++) {
        int level = MIN(left[i], right[i]);
        water += MAX(0, level - heightArray[i]);
    }
    return water;
}

int solution3(int* heightArray, int size) {
    int left = 0, right = size - 1;
    int water = 0;
    int left_max = 0;
    int right_max = 0;
    while (left < right) {
        //{0,1,0,2,1,0,1,3,2,1,2,1};
        if (heightArray[left] < heightArray[right]) {
            if (heightArray[left] >= left_max) {
                left_max = heightArray[left];
            } else {
                water += (left_max - heightArray[left]);
            }
            ++left;
        } else {
            if (heightArray[right] >= right_max) {
                right_max = heightArray[right];
            } else {
                water += (right_max - heightArray[right]);
            }
            --right;
        }
    }
    return water;
}

int trap(int* heightArray, int size) {
    if ((NULL == heightArray) || (0 == size)) { return 0; }
    
    int index = 0;
    int j = 0;
    int k = 0;
    int maxHeightBeforeNow = heightArray[0];
    int maxHeightIndexBeforeNow = 0;
    int preIndex = 0;
    int water = 0;
    
    for (index = 1; index < size; index++) {
        int preHeightPlus = heightArray[index - 1] + 1;
        int currHeight = heightArray[index];
        for(j = preHeightPlus; ((j <= currHeight) && (j <= maxHeightBeforeNow)); j++) {
            preIndex = index - 1;
            for (k = preIndex; k > maxHeightIndexBeforeNow; k--) {
                if (heightArray[k] >= j) {
                    preIndex = k;
                    break;
                }
            }
            int width = index - k - 1;
            int height = MIN(heightArray[k], heightArray[index]) - j + 1;
            water += width * height;
            j = MIN(heightArray[k], heightArray[index]);
        }
        if (heightArray[index] >= maxHeightBeforeNow) {
            maxHeightIndexBeforeNow = index;
            maxHeightBeforeNow = heightArray[index];
        }
    }
    return water;
}


int main(int argc, const char * argv[]) {
    int height[12] = {0,1,0,2,1,0,1,3,2,1,2,1};
    int length = sizeof(height)/sizeof(height[0]);
    //int i = solution1(height, length);
    //int i = solution2(height, length);
    //int i = solution3(height, length);
    int i = trap(height, length);
    printf("%d\n",i);
    return 0;
}
