import UIKit

/*:
 ### [Markup](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/AddingMarkup.html#//apple_ref/doc/uid/TP40016497-CH100-SW1)
 
 ### [朴素算法](https://www.geeksforgeeks.org/naive-algorithm-for-pattern-searching/)
 
 ------
 
 
 
 ## 朴素算法是字符串匹配最简单的算法。
 
 ------
 
 该算法的原理就是通过一个循环找到所有有效偏移，即对检查是否满足条件。
 
 算法没有进行预处理，只是对其进行匹配处理，算法过程中是每次移动一位的比较字符，所以时间复杂度是:
 
 - 最佳情况下的比较次数为`O(n)`
 
 - 最坏情况下的比较次数是`O(m * (n - m + 1))`
 
 - 时间复杂度为`O(m * n)`
 
 
 
 - 什么是 _**最好**_ 的情况？
 
 当第一个字符根本不存在于文本中时，会出现最佳情况。
 
 ```swift
 let txt = "AABCCAADDEE"
 let pat = "FAA"
 ```
 
 
 
 - 什么是 _**最坏**_ 的情况？
 
 朴素算法搜索的最坏情况发生在以下场景中。
 
 当文本和图案的所有字符相同时。
 
 
 
 ```swift
 let txt = "AAAAAAAAAAAAAAAAAA"
 let pat = "AAAAA"
 ```
 
 
 
 - 当最后一个字符不同时，也会出现 _**最坏**_ 情况。
 
 ```swift
 let txt = "AAAAAAAAAAAAAAAAAA"
 let pat = "AAAAB"
 ```
 
 
 
 伪代码：
 
 ```swift
 func naive_string_matcher(s: String, t: String) {
    let m = s.length
    let n = t.length
 
    for(index = 0; index <= m - n; s += 1) {
        if n[0 ..< n] == s[index + 0 ..< index + n] {
            next()
        }
    }
 }
 
 
 
 ```

 */

public extension String {
    subscript(index: Int) -> Character {
        guard let index = self.index(startIndex,
                                     offsetBy: index,
                                     limitedBy: endIndex) else {
                                        fatalError("String index out of range.")
        }
        return self[index]
    }
}

struct BFString {
    private var sourceData: String
    private var targetData: String
    
    public init(sourceData s: String, targetData t: String) {
        self.sourceData = s
        self.targetData = t
    }
    
    public func naive_matcher_1() -> Int {
        if (sourceData.count == 0 ||
            targetData.count == 0 ||
            sourceData.count < targetData.count) {
            return -1
        }
        let s_length = sourceData.count - targetData.count
        for s in 0 ... s_length {
            var flag = false
            for t in 0 ..< targetData.count {
                if sourceData[s + t] == targetData[t] {
                    flag = true
                } else {
                    flag = false
                    break
                }
            }
            if(flag) {
                return s;
            }
        }
        return -1;
    }
    
    public func naive_matcher_2() -> [Int] {
        if (sourceData.count == 0 ||
            targetData.count == 0 ||
            sourceData.count < targetData.count) {
            return []
        }
        let s_length = sourceData.count - targetData.count
        var collection: [Int] = Array.init()
        for s in 0 ... s_length {
            var flag = false
            for t in 0 ..< targetData.count {
                if sourceData[s + t] == targetData[t] {
                    flag = true
                } else {
                    flag = false
                    break
                }
            }
            if(flag) {
                collection.append(s)
            }
        }
        return collection;
    }
    
    public func naive_matcher_3() -> [Int] {
        if (sourceData.count == 0 ||
            targetData.count == 0 ||
            sourceData.count < targetData.count) {
            return []
        }
        let s_length = sourceData.count - targetData.count
        var collection: [Int] = Array.init()
        for s in 0 ... s_length {
            var t = 0
            while t < targetData.count {
                if sourceData[s + t] != targetData[t] {
                    break;
                }
                t += 1
            }
            if t == targetData.count {
                collection.append(s)
            }
        }
        return collection;
    }
}


var bf = BFString.init(sourceData: "我是一个大胖子么,其实我是一个瘦子，才160斤", targetData: "经超")

let find_1 = bf.naive_matcher_1()

if find_1 == -1 {
    print("没有找到呦")
} else {
    print("找到了呦 坐标为 \(find_1)")
}

let find_2 = bf.naive_matcher_2()

if find_2.count == 0 {
    print("没有找到呦")
} else {
    print("找到了呦 坐标为 \(find_2)")
}
let find_3 = bf.naive_matcher_3()

if find_3.count == 0 {
    print("没有找到呦")
} else {
    print("找到了呦 坐标为 \(find_3)")
}







