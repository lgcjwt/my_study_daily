Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
(这个翻译感觉有歧义，也不知道怎么翻译更准确，第一次看中文题的时候反复读了好几遍没明白，结合下面的例子就更懵逼了。)

To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

Note: Do not modify the linked list.

 

Example 1:

Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.


Example 2:

Input: head = [1,2], pos = 0
Output: tail connects to node index 0
Explanation: There is a cycle in the linked list, where tail connects to the first node.


Example 3:

Input: head = [1], pos = -1
Output: no cycle
Explanation: There is no cycle in the linked list.


 

Follow-up:
Can you solve it without using extra space?
