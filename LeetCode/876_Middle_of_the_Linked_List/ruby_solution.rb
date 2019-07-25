# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  slow = head
  fast = head

  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
  end
  return slow
end

#88 ms	9.2 MB