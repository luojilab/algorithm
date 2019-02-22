///Users/lmonster/Desktop/demo/demo/main.cpp
//  main.cpp
//  demo
//
//  Created by 1m0nster on 2018/6/11.
//  Copyright © 2018 1m0nster. All rights reserved.
//

//#include <iostream>
//#include <vector>
//#include <algorithm>
//#include <execinfo.h>
//#include <set>
//#include "RBTree.h"
//
//
//int count(RBTree<int>& tree)
//{
//    int cnt = 0;
//    tree.MLRTranverseTree([&](RBTree<int>::Node *n) {
//        ++cnt;
//    });
//    return cnt;
//}
//
//int main(int argc, const char * argv[])
//{
//    RBTree<int>tree;
//    std::vector<int>values = {5,6,2,7,10,1,3,13,9,14,4};
//    for(int i : values) {
//        tree.insertNode(i);
//    }
//    // fix error
//    tree.MLRTranverseTree([](RBTree<int>::Node *n) {
//        printf("%d : %s\n", n->key, n->color==RBTree<int>::RED ? "RED" : "BLACK");
//    });
//
//    printf("\n");
//    return 0;
//}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <array>
#include <set>
#include <list>
#include <string>
#include <unistd.h>
#include <sys/ipc.h>
#include <sys/types.h>
#include <sys/msg.h>
#include <sys/errno.h>
#include <sys/socket.h>
#include <iostream>
#include <functional>
#include <vector>
#include <ctime>
#include <map>
#include <future>
#include <numeric>
#include <random>
#include <clocale>
#include <fstream>
#include "Test.hpp"

using namespace std;
void lookForPath(vector<int>& candidates, vector<int>path, vector<vector<int>>& ret, int target, size_t lastLevelIdx) {
    if (target == 0) {
        ret.push_back(path);
        return;
    }
    size_t size = candidates.size();
    for (size_t i = 0; i < size; i++) {
        int v = candidates[i];
        if (target - v < 0) {
            break;
        }
        if (lastLevelIdx > i) {
            continue;
        }
        path.push_back(v);
        lookForPath(candidates, path, ret, target - v, i);
        path.pop_back();
    }
}

vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
    vector<vector<int> >ans;
    vector<int>path;
    lookForPath(candidates, path, ans, target, 0);
    return ans;
}

int main(int argc, char const *argv[])
{
    std::vector<int> array = {2,3,5};
    const int target = 8;
    sort(array.begin(), array.end());
    auto ret = combinationSum(array, target);
    for (const auto& list : ret) {
        for (const auto& num : list) {
            printf("%d ", num);
        }
        printf("\n");
    }
    return 0;
}
