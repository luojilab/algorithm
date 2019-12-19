#pragma once

#include <iostream>
#include <vector>
#include <cstring>
#include <algorithm>
#include <string>

namespace future_base {
    // s1+s2
    std::string BigInegerAdd(std::string s1, std::string s2);
    
    // s1 - s2
    // negative == true means s1 < s2
    std::string BigInegerMinus(std::string s1, std::string s2, bool negative);
    
    std::string BigIneger(std::string s1, std::string s2);
}
