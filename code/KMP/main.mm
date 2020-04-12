//
//  main.m
//  KMP
//
//  Created by ChaoGao on 2019/8/8.
//  Copyright © 2019 ChaoGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <stdio.h>
#include <stdlib.h>

void getNext(char * p, int * next)
{
    next[0] = -1;
    int i = 0;
    int k = -1;
    int plen = strlen(p);
    while (i < plen)
    {
        if (k == -1 || p[i] == p[k]){
            ++i;
            ++k;
            next[i] = k;
        }else{
            k = next[k];
        }
    }
    
    for (int i= 0; i< plen; i++) {
        printf("next  %c  %d\n",p[i] ,next[i]);
    }
    
}

int KmpSearch(char* s, char* p)
{
    int i = 0;
    int j = 0;
    long sLen = strlen(s);
    long pLen = strlen(p);
    int *next = new int[pLen];
    getNext(p, next);
    while (i < sLen && j < pLen)
    {
        if (j == -1 || s[i] == p[j]){
            i++;
            j++;
        }else{
            j = next[j];
        }
    }
    
    delete[] next;
    next = NULL;
    
    if (j == pLen){
        return i - j;
    }else{
        return -1;
    }
    
}

int main(int argc, char * argv[]) {
    
    char a[] = "bacbababadababacambabacaddababacasdsd";
    char b[] = "ababaca";
//    char b[] = "abcabca";
//    char b[] = "bab";
    int m = KmpSearch(a,b);
    
    printf("查找到++%d\n\n", m);

}
