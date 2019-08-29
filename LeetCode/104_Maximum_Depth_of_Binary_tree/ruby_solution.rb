# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root == nil
  queue = []
  queue << root
  sum = 0
  while (!queue.empty?)
    count = queue.size
    while (count > 0)
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
      count -= 1
    end
    sum += 1
  end
  return sum       
end

#方法二
def max_depth(root)
  return root == nil ? 0 : [max_depth(root.left), max_depth(root.right)].max
end