package com.luojilab;

public class Leetcode {

    public static void main(String[] args) {
        //构建列表
        ListNode head = new ListNode(1);
        ListNode cur = head;
        for (int i = 0; i < 4; i++) {
            ListNode tmp = new ListNode(i + 2);
            cur.next = tmp;
            cur = tmp;
        }

        //执行算法
//        cur = removeNthFromEnd1(head, 2);

        //n=5的情况
        cur = removeNthFromEnd1(head, 5);

        //输出
        while (cur != null) {
            System.out.println(cur.value);
            cur = cur.next;
        }
    }

    /**
     * 方法一：双遍历法
     *
     * @param head
     * @param n
     * @return
     */
    public static ListNode removeNthFromEnd1(ListNode head, int n) {
        if (head == null || n <= 0) {
            return head;
        }
        ListNode behead = new ListNode(0);
        behead.next = head;
        ListNode cur = behead;
        int length = 0;
        while (cur.next != null) {
            length++;
            cur = cur.next;
        }
        length = length - n;
        cur = behead;
        while (length > 0) {
            length--;
            cur = cur.next;
        }
        cur.next = cur.next.next;
        return behead.next;
    }

    /**
     * 方法二：快慢指针法
     *
     * @param head
     * @param n
     * @return
     */
    public static ListNode removeNthFromEnd2(ListNode head, int n) {
        if (head == null || n <= 0) {
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
}
