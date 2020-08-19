# 49.【Word Search II】



##### 212.Word Search II

Given a 2D board and a list of words from the dictionary, find all words in the board.

Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

---

给定一个二维网格 `board` 和一个字典中的单词列表 `words`，找出所有同时在二维网格和字典中出现的单词。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母在一个单词中不允许被重复使用。

```swift
输入: 
words = ["oath","pea","eat","rain"] and board =
[
  ['o','a','a','n'],
  ['e','t','a','e'],
  ['i','h','k','r'],
  ['i','f','l','v']
]

输出: ["eat","oath"]
```

**说明:**
你可以假设所有输入都由小写字母 `a-z` 组成。

 

##### 79. Word Search

Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

---

给定一个二维网格和一个单词，找出该单词是否存在于网格中。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。

***同一个单元格内的字母不允许被重复使用。***

示例:

```swift
board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
给定 word = "ABCCED", 返回 true
给定 word = "SEE", 返回 true
给定 word = "ABCB", 返回 false
```


提示：

`board`和 `word` 中只包含大写和小写英文字母。

* 1 <= board.length <= 200
* 1 <= board[i].length <= 200
* 1 <= word.length <= 10^3

#### 策略

查找所有单词的常见策略是从左至右（或从右至左）遍历拼图并寻找单词的第一个字母（如果提供了单词列表）。找到字母后，应查看周围的八个字母，以查看该单词的下一个字母是否存在。然后可以继续使用此方法，直到找到整个单词。

在正在搜索的单词中查找“`outstanding`”字母（如果提供了单词列表）。由于大多数单词搜索均使用大小写字母，因此最容易发现与众不同的字母。这些字母包括Q，J，X和Z。



#### 蛇拼图

某些单词搜索难题是**snaking puzzles**，其中的单词不是垂直的垂直，水平或对角线，而是在给定字母上以90度“弯曲”。这些比传统的难题困难得多。当下一个字母可以成45度时，难度级别会进一步提高，并且允许多次使用同一字母。蛇形拼图要么以随机方式隐藏单词，要么被设计为以确定的形状（如正方形，矩形，马蹄形或甜甜圈）描绘出一条路径。

![img](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Slangesiker_FP.jpg/220px-Slangesiker_FP.jpg)

#### 解题开始 🙄

第一种 暴力求解 (略) 相信大家 也都清楚



第二种 DFS （回溯 + 剪枝）

<img src="/Users/smallbei/Library/Application Support/typora-user-images/image-20200811161319532.png" alt="image-20200811161319532" style="zoom: 33%;" />



```swift
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let chars: [Character] = Array(word)
        for n in 0 ..< board.count {
            let count = board[n].count
            for m in 0 ..< count {
                if dfs(&board, word: chars, n: n, m: m, cur: 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: inout [[Character]], word: [Character], 
                   n: Int, m: Int,cur: Int) -> Bool {
        if cur == word.count {
            return true
        }
        guard n >= 0 && n < board.count, m >= 0, m < board[0].count, board[n][m] == word[cur] else {
            return false
        }
        let tmp = board[n][m]
        board[n][m] = "#"

        let res1 = dfs(&board, word: word, n: n - 1, m: m, cur: cur + 1) // 上
        let res2 = dfs(&board, word: word, n: n, m: m - 1, cur: cur + 1) // 左
        let res3 = dfs(&board, word: word, n: n + 1, m: m, cur: cur + 1) // 下
        let res4 = dfs(&board, word: word, n: n, m: m + 1, cur: cur + 1) // 右

        board[n][m] = tmp
        return res4 || res3 || res2 || res1
    }
}
```

![](../../../res/Word-Search/image-20200811191041684.png)

![](../../../res/Word-Search/image-20200811175425523.png)

```swift
class Solution {
    var flag: Bool = false
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let chars: [Character] = Array(word)
        for n in 0 ..< board.count {
            let count = board[n].count
            for m in 0 ..< count {
                if dfs(&board, word: chars, n: n, m: m, cur: 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: inout [[Character]], word: [Character], 
                   n: Int, m: Int,cur: Int) -> Bool {
        if flag || cur == word.count {
            flag = true
            return true
        }
        guard n >= 0 && n < board.count, m >= 0, m < board[0].count, board[n][m] == word[cur] else {
            return false
        }
        let tmp = board[n][m]
        board[n][m] = "#"

        let res1 = dfs(&board, word: word, n: n - 1, m: m, cur: cur + 1) // 上
        let res2 = dfs(&board, word: word, n: n, m: m - 1, cur: cur + 1) // 左
        let res3 = dfs(&board, word: word, n: n + 1, m: m, cur: cur + 1) // 下
        let res4 = dfs(&board, word: word, n: n, m: m + 1, cur: cur + 1) // 右

        board[n][m] = tmp
        return res4 || res3 || res2 || res1
    }
}
```



search O(4l)    l = Len(word)

total  O(n * m * 4l)

Space O(n * m + l)

---

#### 208. 实现 Trie (前缀树)

**trie**，又称**前缀树**或**字典树**, 是一种有序[树](https://zh.wikipedia.org/wiki/树_(数据结构))，用于保存关联数组，其中的键通常是字符串。与二叉查找树不同，键不是直接保存在节点中，而是由节点在树中的位置决定。一个节点的所有子孙都有相同的前缀，也就是这个节点对应的字符串，而根节点对应空字符串。一般情况下，不是所有的节点都有对应的值，只有叶子节点和部分内部节点所对应的键才有相关的值。

单词查找树对某些情况非常实用。除了非常好地存储英文，它同样可以作为‘哈希表’的替代， 它有以下几个优势：

- 查找值时通常有一个更好的最坏的时间复杂度

- 不像哈希表，单词查找树不用担心键冲突问题

- 不需要哈希算法保证每个元素有一个独一无二的路径

- 单词树可以按照字母顺序排序

  

###### 应用

trie树常用于搜索提示。如当输入一个网址，可以自动搜索出可能的选择。当没有完全匹配的搜索结果，可以返回前缀最相似的可能。

简单介绍一下 前缀树

<img src="images/image-20200814104218237.png" alt="image-20200814104218237" style="zoom:33%;" />



大概的数据结构是这个样子滴


![](../../../res/Word-Search/image-20200813154159496.png)





```swift
class TrieNode<T: Hashable> {
    var value: T?
    weak var parentNode: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    var isLeaf: Bool {
        return children.count == 0
    }
    
    init(value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }
    
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value, parentNode: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    fileprivate var wordCount: Int
    public var count: Int {
        return wordCount
    }
    
    public var isEmpty: Bool {
        return wordCount == 0
    }
    
    init() {
        root = Node()
        wordCount = 0
    }
    
    func insert(_ word: String) {
        guard !word.isEmpty else {
            return
        }
        var currentNode = root
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        guard !currentNode.isTerminating else {
            return
        }
        wordCount += 1
        currentNode.isTerminating = true
    }
    
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        guard let node = findLastNodeOf(word: word) else {
            return false
        }
        return node.isTerminating
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard  !prefix.isEmpty else {
            return false
        }
        guard let _ = findLastNodeOf(word: prefix) else {
            return false
        }
        return true
    }
    
    func remove(word: String) {
        guard !word.isEmpty else {
            return
        }
        guard let terminalNode = findLastNodeOf(word: word) else {
            return
        }
        if terminalNode.isLeaf {
            deleteNodesForWordEndingWith(terminalNode: terminalNode)
        } else {
            terminalNode.isTerminating = false
        }
        wordCount -= 1
    }
    
    
    private func findLastNodeOf(word: String) -> Node? {
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return nil
            }
            currentNode = childNode
        }
        return currentNode
    }
    
    private func deleteNodesForWordEndingWith(terminalNode: Node) {
        var lastNode = terminalNode
        var character = lastNode.value
        while lastNode.isLeaf, let parentNode = lastNode.parentNode {
            lastNode = parentNode
            lastNode.children[character!] = nil
            character = lastNode.value
            if lastNode.isTerminating {
                break
            }
        }
    }
}
```

既然有了这个利器，大概你可能就有了大体的思路：



```swift
class Solution {
    var ans: [String] = []
    var trie: Trie = Trie()

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        //building tree
        var board = board
        for word in words {
            trie.insert(word)
        }
        //dfs
        for n in 0..<board.count {
            let count = board[n].count
            for m in 0..<count {
                if trie.isEmpty == false {
                    dfs1(&board, curWord: "", n: n, m: m, node: trie.root)
                }
            }
        }

        return ans
    }

    func dfs(_ board: inout [[Character]], curWord: String, n: Int, m: Int, node: TrieNode<Character>?) {
        if n < 0 || m < 0 || n >= board.count || m >= board[0].count || //越界
                   board[n][m] == "#" { //不可走
            return
        }
        let tmp = board[n][m]
        var curWord = curWord + String(tmp)
        guard let nextNode = node?.children[tmp] else {
            return
        }
        if trie.search(curWord) {
            ans.append(curWord)
            trie.remove(word: curWord)
        }

        board[n][m] = "#"

        dfs1(&board, curWord: curWord, n: n - 1, m: m, node: nextNode) // 上
        dfs1(&board, curWord: curWord, n: n, m: m - 1, node: nextNode) // 左
        dfs1(&board, curWord: curWord, n: n + 1, m: m, node: nextNode) // 下
        dfs1(&board, curWord: curWord, n: n, m: m + 1, node: nextNode) // 右

        board[n][m] = tmp
    }
}
```



Search O(m * n * 4 l) 	l = Len(word)

Space  O(sum(l))
