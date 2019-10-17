Leetcode 算法


# 原题： 

	【Remove Nth Node From End of List】 Given a linked list, remove the n-th node from the end of list and return its head.
	Example:
		Given linked list: 1->2->3->4->5, and n = 2.
		After removing the second node from the end, the linked list becomes 1->2->3->5.
	Note:
		Given n will always be valid.
	Follow up:
		Could you do this in one pass?



# 翻译：

	例子
		给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。例子：给定一个链表: 1->2->3->4->5, 和 n = 2.
	当删除了倒数第二个节点后，链表变为 1->2->3->5.
	说明：
		给定的 n 保证是有效的。
	进阶：
		你能尝试使用一趟扫描实现吗？


-------------------------
### 方案一：双遍历法
删除从列表开头数起的第 (L−n+1) 个结点，其中L是列表的长度。只要我们找到列表的长度L，这个问题就很容易解决。

画图：
  
  ![](../../res/Leetcode24/1.jpg)

代码：

```java   
public ListNode removeNthFromEnd(ListNode head, int n) {
        if (head == null || n <= 0){
            return head;
        }
        ListNode behead = new ListNode(0);
        behead.next = head;
        ListNode cur = behead;
        int length = 0;
        while(cur.next != null){
            length++;
            cur = cur.next;
        }
        length = length - n; 
        cur = behead;
        while(length > 0){
            length--;
            cur = cur.next;
        }
        cur.next = cur.next.next;
        return behead.next;
}

```  
 
### 方案二：快慢指针
#### 概述
基于快慢指针，要删除第n个节点，可以设置一个快指针fast，让它先移动n步（此时在第n-1个节点），然后再设置一个慢指针从头开始，和快指针以相同速度前进，当快指针走到最后一个节点，慢指针恰好走到第n-1个节点，要删除第n个节点，直接令slow.next = slow.next.next即可，这里假设是第n-1个节点必定存在。
#### 画图：

#### 代码：

```java   
public ListNode removeNthFromEnd(ListNode head, int n) {
        if (head == null || n <= 0){
            return head;
        }
        ListNode behead = new ListNode(0);
        behead.next = head;
        ListNode slow = behead, fast = behead;
        for (int i = 0; i < n; i++) {
            fast = fast.next;
        }
        while (fast.next != null) {
            slow = slow.next;
            fast = fast.next;
        }
        slow.next = slow.next.next;
        return behead.next;
}
```   


#### 复杂度 
这两种方法的时间复杂度和空间复杂度：
时间复杂度：O(L)
空间复杂度：O(1)
