#1.冒泡排序
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  nums.size.times do |i|
  	(nums.size - i).times do |j|
      if nums[j] >= nums[j+1]
      	tmp = nums[j+1]
      	nums[j+1] = nums[j]
      	nums[j] = tmp
      else
      	next
      end
    end
  end
  return nums 
end

#超出时间限制

#2.选择排序
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  tmp = []
  nums.size.times { tmp << nums.delete_at(nums.index(nums.min))}
  return tmp
end
#超出时间限制

#3.插入排序
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  nums.each_with_index do | num, index|
  	next if index == 0
  	j = index -1
  	while j >= 0 && nums[j] > num
  		nums[j+1] = nums[j]
  		j -= 1
  	end
  	nums[j+1] = num
  end
  return nums
end
#超出时间限制

#4.归并排序
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  merge_sort(nums, 0, nums.size - 1)
  return nums
end

def merge_sort(nums, left, right)
  if left < right
  	middle = (right + left)/2
  	merge_sort(nums, left, middle)
  	merge_sort(nums, middle + 1, right)
  	merge(nums, left, middle, right)
  end
end

def merge(nums, left, middle, right)
  arrL, arrR = nums[left..middle], nums[middle+1..right]
  arrL[arrL.size] = arrR[arrR.size] = "stop"
  for k in (left..right)
  	if arrL.first == "stop"
       nums[k] = arrR.shift
  	elsif arrR.first == "stop"
       nums[K] = arrL.shift
  	else
  		arrL.first <= arrR.first ? nums[k] = arrL.shift : nums[k] = arrR.shift
  	end
  end
end

# 896 ms	12.3 MB

#5.快速排序

def sort_array(nums)
  return [] if nums == []
  flag = nums[(nums.size)/2]
  left = []
  right = []
  nums.each_with_index do |num, i|
    next if i == (nums.size)/2
    left += [num] if num <= flag
    right += [num] if num > flag
  end
  leftL = sort_array(left)
  rightR = sort_array(right)
  return leftL + [flag] + rightR
end
# 超出时间限制

#6.桶排序

#7.计数排序

#8.基数排序
#678高效。但是很调排序场景，普通的场景反而速度更慢，空间复杂度更高
