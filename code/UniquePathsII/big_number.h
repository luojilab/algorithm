#pragma once

#include <iostream>
#include <vector>
#include <cstring>
#include <algorithm>
#include <string>

namespace future_base {
    std::string BigIntegerAdd(std::string s1, std::string s2);
    
    // negative == true means s1 < s2
    std::string BigIntegerMinus(std::string s1, std::string s2, bool negative);
    
    std::string BigInteger(std::string s1, std::string s2);
}
