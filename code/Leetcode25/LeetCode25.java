import com.sun.istack.internal.Nullable;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

public class LeetCode25 {
    public static void main(String[] args) {
        LeetCode25 test = new LeetCode25();
        
        System.out.println("abcabcbb:" + test.longestSubStringSlidingWindow("abcabcbb"));
        System.out.println("bbbbb:" + test.longestSubStringSlidingWindow("bbbbb"));
        System.out.println("pwwkew:" + test.longestSubStringSlidingWindow("pwwkew"));
        System.out.println("pwwkew:" + test.longestSubStringSlidingWindow("powkew"));
        
    }
    
    @Nullable
    public String longestSubStringSlidingWindow(@Nullable String s) {
        if (s == null || s.length() == 0) {
            return null;
        }
        
        int maxLength = 0;
        int resultIndex = 0;
        
        Set<Character> set = new LinkedHashSet<>();
        
        int length = s.length();
        int i = 0, j = 0;
        
        while (i < length && j < length) {
            
            if (set.contains(s.charAt(j))) {
                set.remove(s.charAt(i));
    
                i++;
                continue;
            }
            
            set.add(s.charAt(j));
            
            int newLength = j - i + 1;
            if (newLength > maxLength) {
                maxLength = newLength;
                resultIndex = i;
            }
            
            j++;
        }
        
        return maxLength == 0 ? null : s.substring(resultIndex, resultIndex + maxLength);
    }
    
    @Nullable
    public String longestSubString(@Nullable String s) {
        if (s == null || s.length() == 0) {
            return null;
        }
        
        int maxLength = 0;
        int resultIndex = 0;
        
        int n = s.length();
        
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                if (hasDuplicateChar(s, i, j)) {
                    break;
                }
                
                int newLength = j - i + 1;
                if (newLength <= maxLength) {
                    continue;
                }
                
                
                maxLength = newLength;
                resultIndex = i;
            }
        }
        
        return maxLength == 0 ? null : s.substring(resultIndex, resultIndex + maxLength);
    }
    
    private boolean hasDuplicateChar(String subStr, int start, int end) {
        Set<Character> set = new HashSet<>();
        
        for (int i = start; i <= end; i++) {
            Character ch = subStr.charAt(i);
            
            if (set.contains(ch)) {
                return true;
            }
            
            set.add(ch);
        }
        
        return false;
    }
}
