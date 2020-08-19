#include <algorithm> 
#include "edit_dist_recursion.h"

int editDistRecursion(const std::string &word1, const std::string &word2) {
	return editDist(word1, word2, word1.size(), word2.size());
}

static int min(int x, int y, int z)
{
	return std::min(std::min(x, y), z);
}


int editDist(const std::string &word1 , const std::string &word2, int m, int n) { 
    // If first string is empty, the only option is to 
    // insert all characters of second string into first 
    if (m == 0){
        return n;
    }		
  
    // If second string is empty, the only option is to 
    // remove all characters of first string 
    if (n == 0){ 
        return m; 
    }
    // If last characters of two strings are same, nothing 
    // much to do. Ignore last characters and get count for 
    // remaining strings. 
    if (word1[m - 1] == word2[n - 1]) {
        return editDist(word1, word2, m - 1, n - 1);
    }
    // If last characters are not same, consider all three 
    // operations on last character of first string, recursively 
    // compute minimum cost for all three operations and take 
    // minimum of three values. 
    return 1 + min(editDist(word1, word2, m, n - 1), // Insert 
		editDist(word1, word2, m - 1, n), // Remove 
		editDist(word1, word2, m - 1, n - 1) // Replace 
        ); 
}