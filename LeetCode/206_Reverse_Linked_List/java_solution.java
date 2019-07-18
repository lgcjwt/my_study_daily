  /**
   * Definition for singly-linked list.
   * public class ListNode {
   *     int val;
   *     ListNode next;
   *     ListNode(int x) { val = x; }
   * }
   */
  class Solution {
      public ListNode reverseList(ListNode head) {
          ListNode pre = null;
          ListNode tmp = null;

          while(head != null) {
              tmp =  head.next;
              head.next = pre;
              pre = head;
              head = tmp;
          }
          return pre;
      }
  }

  //  1 ms  36.4 MB

  // 递归

  class Solution{
    public ListNode reverseList(ListNode head){
        return reverse(null, head);
    }

    private ListNode reverse(ListNode pre, ListNode cur){
        if(cur == null) return pre;
        ListNode tmp = cur.next;
        cur.netxt = pre;
        return reverse(cur, tmp);
    }
  }

  //2 ms  36.4 MB