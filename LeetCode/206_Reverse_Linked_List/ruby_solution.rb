

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
def reverse_list(head)
  pre = nil
  while head
  	head.next, pre, head = pre, head, head.next
  end
  return pre
end

# head.next = pre 切分出来新的链表，并把原来的pre拼接上来
# pre = head 把重新组合的head付给pre
# head = head.next 给head重新赋值继续循环。


#执行用时 :56 ms, 在所有 Ruby 提交中击败了 41.18%的用户
#内存消耗 :9.5 MB, 在所有 Ruby 提交中击败了 100.00% 的用户

#递归

def reverse_lest(head)
  reverse(nil, head)
end

def reverse(pre, cur)
  return pre if cur == nil
  tmp = cur.next
  cur.next = pre
  return reverse(cur, tmp)
end

#84 ms	10 MB