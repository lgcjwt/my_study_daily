# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  fast = head
  slow = head
  
  n.times do 
      fast = fast.next
  end
    
  return head.next if fast == nil
  while fast.next != nil
      slow = slow.next
      fast = fast.next
  end

  slow.next = slow.next.next

  return head
end

# 64 ms 9.3 MB