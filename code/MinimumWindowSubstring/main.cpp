#include <iostream>
#include <unordered_map>

std::string FindMinimumWindowSubstring(std::string source,
                                       std::string target) {
    
    if (source.empty() || target.empty()) {
        return "";
    }

    size_t source_len = source.length();
    size_t target_len = target.length();

    if (source_len < target_len) {
        return "";
    }

    size_t start = 0;           //符合条件的最小窗口的字符串位置
    size_t min_len = UINT_MAX;  //符合条件的最小窗口字符长度
    
    //1）初始化
    size_t left = 0;            //left指针
    size_t right = 0;           //right指针

    std::unordered_map<char, size_t> window_char_map;    //记录当前子串对应char
    std::unordered_map<char, size_t> target_char_map;    //记录目标子串对应char

    for (char c : target) {
        target_char_map[c]++;
    }
    
    size_t target_char_map_len = target_char_map.size();    //target子串中包含字符的个数（去重后）

    size_t match = 0;   //记录已经匹配的字符个数（去重后）
    
    //4）重复：直到S串末尾
    while (right < source_len) {
        
        //2）找到可行窗口，即包含T中所有字符的窗口。
        char current_char = source[right];
        
        //如果target包含该字符
        if (target_char_map.count(current_char)) {
            
            //在当前子串标记匹配该字符
            window_char_map[current_char]++;
            
            if (window_char_map[current_char] == target_char_map[current_char]) {
                match++;    //累加已经匹配字符个数
            }
        }
        right++;    //right指针右移

        //3）如果当前窗口可行，则想办法右移left指针。
        while (match == target_char_map_len) {
            
            //如果符合条件的最小窗口len发生变化，则更新
            if (right - left < min_len) {
                
                //移动记录符合条件的start位置
                start = left;
                
                //更新符合条件的最小窗口len
                min_len = right - left;
            }
            
            char left_char = source[left];
            
            //如果left位置的字符在target中
            if (target_char_map.count(left_char)) {
                
                //从当前窗口中减掉left位置的字符
                if (window_char_map.count(left_char)) {
                    window_char_map[left_char]--;
                }
                
                //如果left位置的字符，在target中是必须的，则match - 1，这会导致下一个while循环终止，即left指针右移操作终止；
                //直到找到可行窗口后，再执行第3）步。
                if (window_char_map[left_char] < target_char_map[left_char]) {
                    if (match > 0) {
                        match--;
                    }
                }
            }
            
            left++; //left指针右移
        }
    }
    
    return min_len == UINT_MAX ? "" : source.substr(start, min_len);
}

int main(int argc, const char * argv[]) {
    
    std::string source = "";
    std::string target = "ABC";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubstring(source, target).c_str());
    
    source = "ADOBECODEBANC";
    target = "";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubstring(source, target).c_str());
    
    source = "ADOBECODEBANC";
    target = "ADOBECODEBANCC";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubstring(source, target).c_str());
    
    source = "ADOBECODEBANC";
    target = "ABC";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubstring(source, target).c_str());

    source = "ADOBECODEBANC";
    target = "ABAC";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubString(source, target).c_str());
    
    source = "ADOBECODEBANC";
    target = "BECE";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubString(source, target).c_str());
    
    source = "ADOBECODEBANC";
    target = "ABCAC";
    printf("\nsource: %s\ntarget: %s\nMinimum window substring is: %s\n", source.c_str(), target.c_str(), FindMinimumWindowSubString(source, target).c_str());
    
    return 0;
}
