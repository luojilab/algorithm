#include <stdlib.h>
#include <string>
#include <chrono>
#include <iostream>
#include "edit_dist_recursion.h"
#include "edit_dist_dp.h"
#include "edit_dist_dp_best.h"

int main(int argc, char* argv[]){
	if (argc < 4) {
		std::cout << "parameter count is error!\n";
		return -1;
	}

	std::string word1(argv[1]);
	std::string word2(argv[2]);
	std::string way(argv[3]);
	int dist = 0;
	auto beginTime = std::chrono::high_resolution_clock::now();

	if (way == "recursion") {
		dist = editDistRecursion(word1, word2);
	}else if (way == "dp") {
		dist = editDistDp(word1, word2);
	}else if (way == "dp_best") {
		dist = editDistDpBest(word1, word2);
	}else {
		std::cout << "parameter is err!\n";
		return -1;
	}
	auto endTime = std::chrono::high_resolution_clock::now();
	auto elapsedTime = std::chrono::duration_cast<std::chrono::microseconds>(endTime - beginTime);
	std::cout << "elapsed time is " << elapsedTime.count() << " microseconds" << std::endl;

	std::cout<< "the min eidt distance is:" << dist << "\n";
    return 0;
}