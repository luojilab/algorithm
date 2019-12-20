#include "big_number.h"

namespace future_base {
    
// s1+s2
std::string BigIntegerAdd(std::string s1, std::string s2) {
    int len = s1.size()>s2.size()?s1.size()+1:s2.size()+1;
    std::string res(len, '0');
    int i = s1.size() - 1, j = s2.size() - 1, k = len - 1;
    int borrow = 0;
    
    while(i >=0 && j >= 0) {
        int sum = s1[i] - '0' + s2[j] - '0' + borrow;
        if (sum >= 10) {
            borrow = 1;
            sum -= 10;
            res[k--] = sum + '0';
        } else {
            res[k--] = sum + '0'; borrow = 0;
        }
        
        i--;
        j--;
    }
    
    while(i >= 0) {
        int sum = s1[i] - '0' + borrow;
        if (sum >= 10) {
            borrow = 1;
            sum -= 10;
            res[k--] = sum + '0';
        } else {
            res[k--] = sum + '0'; borrow = 0;
        }
        
        i--;
    }
    
    while(j >= 0) {
        int sum = s2[j] - '0' + borrow;
        if (sum >= 10) {
            borrow = 1;
            sum -= 10;
            res[k--] = sum + '0';
        } else {
            res[k--] = sum + '0'; borrow = 0;
        }
        
        j--;
    }
    
    if (borrow == 1) {
        res[k] = '1';
    } else {
        res[k] = '0';
    }
    
    //ignore the prefix '0's
    if (res[0] == '0') {
        return res.substr(1, res.size()-1);
    }
    
    else return res;
    
}

// s1 - s2
// negative == true means s1 < s2
std::string BigIntegerMinus(std::string s1, std::string s2, bool negative) {
    if (s1.size() < s2.size()) {
        return BigIntegerMinus(s2, s1, true);
    }
    
    if (s1.size() == s2.size()) {
        int i = 0;
        while(i < s1.size() && s1[i] == s2[i])
            i++;
        if (s1[i] < s2[i])
        {
            return BigIntegerMinus(s2, s1, true);
        }
    }
    
    std::string res(s1.size(), '0');
    int i = s1.size() -1, j = s2.size() - 1;
    int k = i;
    int borrow = 0;
    
    while(i >= 0 && j >= 0) {
        int sum = s1[i] - '0' - borrow - (s2[j] - '0');
        
        //cout<<sum<<endl;
        if (sum < 0) {
            borrow = 1;
            sum += 10;
            res[k--] = sum + '0';
        } else {
            borrow = 0;
            res[k--] = sum + '0';
        }
        
        i--;
        j--;
    }
    
    while(i >= 0) {
        int sum = s1[i--] - '0' - borrow;
        if (sum < 0) {
            borrow = 1;
            sum += 10;
            res[k--] = sum + '0';
        } else {
            borrow = 0;
            res[k--] = sum + '0';
        }
    }
    
    if (res[0] == '0') {
        //ignore the prefix '0's
        int index = 1;
        while(index < res.size() && res[index] == '0') {
            index++;
        }
        
        if (negative) {
            return "-" + res.substr(index, res.size() - index);
        } else {
            return res.substr(index, res.size() - index);
        }
    } else {
        if (negative) {
            return "-" + res;
        }
        else {
            return res;
        }
    }
}

std::string BigInteger(std::string s1, std::string s2) {
    if (s1 == "") {
        return s2;
    }
    
    if (s2 == "") {
        return s1;
    }
    
    char sign1 = '+', sign2 = '+';
    if (s1[0] == '-') {
        sign1 = '-';
    }
    
    if (s2[0] == '-') {
        sign2 = '-';
    }
    
    if (sign1 == '+' && sign2 == '+') {
        return BigIntegerAdd(s1, s2);
    } else if (sign1 == '+' && sign2 == '-') {
        return BigIntegerMinus(s1, s2.substr(1, s2.size()-1),false);
    } else if (sign1 == '-' && sign2 == '+') {
        return BigIntegerMinus(s2, s1.substr(1, s1.size()-1), false);
    } else {
        std::string tmp = BigIntegerAdd(s1.substr(1, s1.size()-1), s2.substr(1, s2.size()-1));
        if (tmp[0] == '0') {
            tmp = tmp.substr(1, tmp.size()- 1);
        }
        
        std::string res = "-" + tmp;
        return res;
    }
}

}
