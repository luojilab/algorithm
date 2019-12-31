61. **【Min Stack】** Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

    - push(x) -- Push element x onto stack.
    - pop() -- Removes the element on top of the stack.
    - top() -- Get the top element.
    - getMin() -- Retrieve the minimum element in the stack.

    **Example:**

    ```
    MinStack minStack = new MinStack();
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    minStack.getMin();   --> Returns -3.
    minStack.pop();
    minStack.top();      --> Returns 0.
    minStack.getMin();   --> Returns -2.
    ```

###中文版：

设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

- push(x) -- 将元素 x 推入栈中。
- pop() -- 删除栈顶的元素。
- top() --  获取栈顶元素。
- getMin() -- 检索栈中的最小元素。

###问题分析：

我们都知道 push(x), pop(), top() 的时间复杂度是 O(1)，这道问题的难点在于如何实现时间复杂度是 O(1) 的 getMin()。

Note: 元素为整数，这道题不考虑 pop(), top(), getMin()为空的情况，即 pop(), top(), getMin() 的时候栈顶一定有元素。

###简化版解法：

我们可以先简化一下这道题：getMin() 的时间复杂度可以不为常数。

这样就简单了，getMin() 直接遍历并返回栈中的最小元素即可，代码如下：

```swift
class SimplifiedVersion: SolutionType {
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        stack.append(x)  // O(1)
    }

    func pop() {
        _ = stack.popLast()  // O(1)
    }

    func top() -> Int {
        return stack.last!  // O(1)
    }

    func getMin() -> Int {
        return stack.min()!  // O(n)
    }
}
```

getMin() 中用的系统函数 min() 的时间复杂度是O(n)。

时间复杂度：O(n)

空间复杂度：O(1)

###解法一： 基栈+辅助栈

核心思想：用一个辅助栈保存当前所有元素的最小值

基栈：用于保存元素（可以用数组，或者其他方便的数据结构，这里我们用数组）

辅助栈：保存最小值，它的栈顶总是保存当前所有元素的最小值（单调栈）。构造辅助栈的操作如下：

1. 入栈时，如果辅助栈为空，或者新加入的元素小于栈顶元素，那么就将新元素入栈，否则不做处理。
2. 出栈时，如果出栈元素等于栈顶元素，那么就将栈顶元素出栈，否则不做处理。

举个例子🌰：

```
入栈 3 ， minStack 为空 ，入栈
|   |    |   |
|   |    |   |
|_3_|    |_3_|
stack  minStack
 
入栈 5 ， 5 大于 minStack 栈顶 ，不处理
|   |    |   |
| 5 |    |   |
|_3_|    |_3_|
stack  minStack
 
入栈 2 ， 2 小于 minStack 栈顶 , 入栈
| 2 |    |   |
| 5 |    | 2 |
|_3_|    |_3_|
stack  minStack
 
出栈 ， 2 等于 minStack 栈顶 ， 出栈
|   |    |   |
| 5 |    |   |
|_3_|    |_3_|
stack  minStack

出栈 ，5 不等于minStack 栈顶 ， 不处理
|   |    |   |
|   |    |   |
|_3_|    |_3_|
stack  minStack
```

代码如下：

```swift
class Solution1: SolutionType {
    var stack = [Int]()
    var minStack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
    }

    func pop() {
        if stack.popLast()! == minStack.last! {
            _ = minStack.popLast()
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
```

时间复杂度：O(1)

空间复杂度：O(n) (最差情况)

###解法二：一个栈实现

解法一中用了两个栈去实现，那么我们能不能用一个栈去实现呢？

解法一中单独用了一个栈去保存所有最小值，那么我们能不能只用一个变量去保存最小值呢？

假设我们用一个变量去保存最小值，再看下上面的例子🌰。

```
入栈 3 
|   |   min = 3
|   |     
|_3_|    
stack   

入栈 5 
|   |   min = 3
| 5 |     
|_3_|    
stack  

入栈 2  => 问题
| 2 |   min = 2？
| 5 |     
|_3_|    
stack  
```

如果只用一个变量就会遇到一个问题，如果把 `min` 更新为 `2`，那么之前的最小值 `3` 就丢失了。

怎么把 `3` 保存起来呢？把它在 `2` 之前压入栈中即可。再看下刚才的例子🌰：

```
入栈 2 ，先将之前的 min 值 3 入栈，再把 2 入栈，同时更新 min = 2
| 2 |   min = 2
| 3 |  
| 5 |     
|_3_|    
stack  

入栈 6 
| 6 |  min = 2
| 2 |   
| 3 |  
| 5 |     
|_3_|    
stack  

出栈 6     
| 2 |   min = 2
| 3 |  
| 5 |     
|_3_|    
stack  

出栈 2  => 问题
| 2 |   min = 2
| 3 |  
| 5 |     
|_3_|    
stack  
```

上边的最后一个状态，当出栈元素是最小元素我们该如何处理呢？

我们只需要把 `2` 出栈，然后再出栈一次，把 `3` 赋值给 `min` 即可。

```
出栈 2     
|   |  min = 3   
| 5 |   
|_3_|    
stack  
```

总结就是：

核心思想：一个栈，用一个变量代表最小值，并且

1. 入栈时：当有更小的值来的时候，我们只需要把之前的最小值入栈，在将当前更小的值再入栈，否则直接入栈。
2. 出栈时：如果出栈元素就是最小值，那下一个元素就是之前的最小值，更新最小值并出栈下一个元素，否则直接出栈。

代码如下：

```swift
class Solution2: SolutionType {
    
    var min: Int = Int.max
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        if (x <= min) {
            stack.append(min)
            min = x
        }
        stack.append(x)
    }

    func pop() {
        if stack.popLast()! == min {
            min = stack.popLast()!
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return min
    }
}
```

时间复杂度：O(1)

空间复杂度：O(n) (最差情况)

### 解法三：差值法

通过解法二的分析，我们关键要解决的问题就是当有新的更小值的时候，之前的最小值该怎么办？

解法二中通过把之前的最小值入栈解决问题。那么我们能不能不用额外入栈去实现呢？

核心思想：同样是用一个 min 变量保存最小值。只不过栈里边我们不去保存原来的值，而是去存储入栈的值和最小值的差值，即 ：

​	栈顶元素 = 入栈元素 - min

具体操作如下：

1. 入栈时，存储入栈的值和当前最小值的差值，同时更新最小值
2. 出栈时，如果栈顶元素是正数，代表 min 不变，返回 栈顶元素 + min。如果栈顶元素是负数，说明之前对 min 进行了更新，因为入栈元素就是当前的min，所以返回min， 之前的 min = 入栈元素（当前的min） - 栈顶元素 。

举个例子🌰：

```
入栈 3, min = 3, 存入 3 - 3 = 0
|   |   min = 3
|   |     
|_0_|    
stack   

入栈 5，存入 5 - 3 = 2
|   |   min = 3
| 2 |     
|_0_|    
stack  

入栈 2，存入  2 - 3 = -1, 并且更新 min = 2  
| -1|   min = 2
| 5 |     
|_3_|    
stack  

入栈 6，存入  6 - 2 = 4
| 4 |   min = 2
| -1| 
| 5 |     
|_3_|    
stack  

出栈，返回的值 = 4 + min = 4 + 2 ，就是 6
|   |   min = 2
| -1| 
| 5 |     
|_3_|    
stack  

出栈，因为栈顶元素为负，返回的值 = min = 2, 更新 min = 入栈元素 - 栈顶元素 = 2 - (-1) = 3
|   | min = 3
| 5 |     
|_3_|    
stack    
```

代码如下：

```swift
class Solution3: SolutionType {
    
    var min: Int = Int.max
    var stack = [Int]()

    init() {
    }

    func push(_ x: Int) {
        if stack.isEmpty {
            min = x
            stack.append(x - min)
        } else {
            stack.append(x - min)
            if (x < min) {
                min = x
            }
        }
    }

    func pop() {
        let pop = stack.popLast()!
        if (pop < 0) {
            min = min - pop
        }
    }

    func top() -> Int {
        let top = stack.last!
        if (top < 0) {
            return min
        } else {
            return top + min
        }
    }

    func getMin() -> Int {
        return min
    }
}
```

时间复杂度：O(1)  （但因为有很多逻辑判断，栈小的时候不一定快）

空间复杂度：O(1)

### 解法四：新数据结构

解法三没有引入新的存储空间，但是逻辑比较复杂，有没有逻辑简单的解法呢？

其实我们的最终目的是要记录最小值，解法一用了辅助栈去记录，解法二额外入栈了之前的最小值，解法三用差值法记录。这启发我们可以设计一个新的数据结构去存储这个最小值。

这里我们创造一个Node结构体，里面用 value 属性存储元素，用 min 属性储存最小值，这样的话每次加入一个节点的时候，我们同时只要确定它的 `min` 值即可。

代码如下：

```swift
struct Node {
    let value: Int
    let min: Intx
}

class Solution4: SolutionType {
    var stack = [Node]()

    init() {}

    func push(_ x: Int) {
        let node = Node(value: x, min: min(stack.last?.min ?? x, x))
        stack.append(node)
    }

    func pop() {
        _ = stack.popLast()
    }

    func top() -> Int {
        return stack.last!.value
    }

    func getMin() -> Int {
        return stack.last!.min
    }
}
```

时间复杂度：O(1)  

空间复杂度：O(n) （因为 Node 中的 min 属性占用了空间）

### 总结

四种解法总结如下：

|    解法    | 解法一： 基栈+辅助栈 | 解法二：一个栈实现 | 解法三：差值法 | 解法四：新数据结构 |
| :--------: | :------------------: | :----------------: | :------------: | :----------------: |
|    思想    |      空间换时间      |     空间换时间     |   逻辑换时间   |     空间换时间     |
|  实现方法  |        两个栈        |       一个栈       |      差值      |     改数据结构     |
| 时间复杂度 |         O(1)         |        O(1)        |      O(1)      |        O(1)        |
| 空间复杂度 |         O(n)         |        O(n)        |      O(1)      |        O(n)        |

### 思考

LRU (最近最少使用) 缓存机制：

获取数据 get(key) ： 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。

写入数据 put(key, value) ： 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。

要求： O(1) 时间复杂度内完成这两种操作