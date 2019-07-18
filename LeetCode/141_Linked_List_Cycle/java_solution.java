 /**
   * Definition for singly-linked list.
   * class ListNode {
   *     int val;
   *     ListNode next;
   *     ListNode(int x) {
   *         val = x;
   *         next = null;
   *     }
   * }
   */
  public class Solution {
      public boolean hasCycle(ListNode head) {
          ListNode slow = head;
          ListNode fast = head;
          while (fast != null && fast.next != null){
              slow = slow.next;
              fast = fast.next.next;
              if (slow == fast) return true;
          }
          return false;
      }
  }



  //快慢指针
  //如果快指针能遇到next是null，说明没有环。在while中如果有环必然会有fast和slow的链表完全相等的时候