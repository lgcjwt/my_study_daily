# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  tmp = ListNode.new(nil)
  p = tmp
  while l1 != nil && l2 != nil
    if l1.val <= l2.val
      p.next = l1
      p = p.next
      l1 = l1.next
    else
      p.next = l2
      p = p.next
      l2 = l2.next
    end
  end
  if l1 == nil
    p.next = l2
  else
    p.next = l1
  end
  return tmp.next
end

# 88 ms 9.6 MB