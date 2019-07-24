### [Markup](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/AddingMarkup.html#//apple_ref/doc/uid/TP40016497-CH100-SW1)

 ### [朴素算法](https://www.geeksforgeeks.org/naive-algorithm-for-pattern-searching/)

[要是看不懂那就看图](https://www.javatpoint.com/daa-naive-string-matching-algorithm)



---



##朴素算法是字符串匹配最简单的算法。

---

 该算法的原理就是通过一个循环找到所有有效偏移，即对检查是否满足条件。

 算法没有进行预处理，只是对其进行匹配处理，算法过程中是每次移动一位的比较字符，所以时间复杂度是:

- 最佳情况下的比较次数为`O(n)`

- 最坏情况下的比较次数是`O(m * (n - m + 1))`

- 时间复杂度为`O(m * n)`



+ 什么是 _**最好**_ 的情况？

  当第一个字符根本不存在于文本中时，会出现最佳情况。

```swift
let txt = "AABCCAADDEE"
let pat = "FAA"	
```



+ 什么是 _**最坏**_ 的情况？

  朴素算法搜索的最坏情况发生在以下场景中。

  当文本和图案的所有字符相同时。

  

  ```swift
  let txt = "AAAAAAAAAAAAAAAAAA"
  let pat = "AAAAA" 
  ```

  

+ 当最后一个字符不同时，也会出现 _**最坏**_ 情况。

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



# 好吧～举个例子🌰

 `S` = `我是一个大胖子么,其实我是一个瘦子，才160斤`

 `T` = `我是一个瘦子`

| i = 0,  j = 0 | i = 1, j = 1 | i = 2, j = 2 | i = 3, j = 3 | i = 4, j = 4 （失败） |
| ------------- | :----------- | ------------ | ------------ | --------------------- |
| 我            | 是           | 一           | 个           | 大                    |
| 我            | 是           | 一           | 个           | 瘦                    |



| i = 1, j = 0 | i = 2, j = 0 | i = 3, j = 0 | i = 4, j = 0 | i = 5, j = 0 | i = 6, j = 0 |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| 是           | 一           | 个           | 大           | 胖           | 子           |
| 我           | 我           | 我           | 我           | 我           | 我           |

此处省略500字

| i = 11, j = 0 | i = 12, j = 1 | i =1 3, j = 2 | i = 14, j = 3 | i = 15, j = 4 | i = 16, j = 5 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 我            | 是            | 一            | 个            | 瘦            | 子            |
| 我            | 是            | 一            | 个            | 瘦            | 子            |

```swift
if j == T.count {
 	return i 
}
```





