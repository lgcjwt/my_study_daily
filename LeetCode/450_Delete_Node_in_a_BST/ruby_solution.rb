#被删除节点三种情况
#1.只有一个子树
#2.左右子树都存在
#3.没有子树

#两种方法
#1.删除后取左子树最大节点
#2.删除后取右子树最小节点

#1.删除后取左子树最大节点
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
	#没有子树
  return root unless root
  if key < root.val
  	root.left = delete_node(root.left, key)
  	return root
  end

  if key > root.val
  	root.right = delete_node(root.right, key)
  	return root
  end

  #只有一个子树
  unless root.left
  	new_root = root.right
  	root.right = nil
  	return new_root
  end
  #只有一个子树
  unless root.right
  	new_root = root.left
  	root.left = nil
  	return new_root
  end

  #有两个子树
  predecessor = maximum(root.left)
  predecessor_copy = TreeNode.new(predecessor.val)
  predecessor_copy.left = remove_max(root.left)
  predecessor_copy.right = root.right
  root.left = nil
  root.right = nil
  return predecessor_copy
end

def maximum(root)
  while root.right
  	root = root.right
  end
  return root
end

def remove_max(root)
  unless root.right
  	new_root = root.left
  	root.left = nil
  	return new_root
  end

  root.right = remove_max(root.right)
  return root
end

#2.删除后取右子树最小节点
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
  return root unless root
  if key < root.val
  	root.left = delete_node(root.left, key)
  	return root
  end

  if key > root.val
  	root.right = delete_node(root.right, key)
  	return root
  end

  unless root.left
  	new_root = root.right
  	root.right = nil
  	return new_root
  end

  unless root.right
  	new_root = root.left
  	root.left = nil
  	return new_root
  end

  after = minist(root.right)
  after_copy = TreeNode.new(after.val)
  after_copy.right = remove_min(root.right)
  after_copy.left = root.left
  root.left = nil
  root.right = nil
  return after_copy
end

def minist(root)
  while root.left
  	root = root.left
  end
  return root
end

def remove_min(root)
  unless root.left
  	new_root = root.right
  	root.right = nil
  	return new_root
  end
  root.left = remove_min(root.left)
  return root
end

































