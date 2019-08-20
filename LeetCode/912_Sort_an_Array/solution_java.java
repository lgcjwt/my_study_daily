//1.冒泡O(n*n)
class Solution {
    public int[] sortArray(int[] nums) {
    	int tmp;
        for(int i = 1; i <= nums.length; i ++){
        	boolean flag = false;
        	for(int j = 1; j <= nums.length - i - 1; j ++){
        		if(nums[j] >= nums[j+1]){
                    tmp = nums[j+1];
                    nums[j+1] = nums[j];
                    nums[j] = tmp;
                    flag = true;
        		}
        	}
        	if (flag === false){
        		return nums;
        	}
        }
        return nums;
    }
}

//超出时间限制

//2.选择排序
// @param {Integer[]} nums
// @return {Integer[]}
class Solution {
	public int[] sortArray(int[] nums) {
		for(int i = 0; i < nums.length - 1; i ++){
			int min = i;
			for(int j = i + 1; j < nums.length; j ++){
				if (nums[min]>nums[j]){
					min = j;
				}
			}
			if (min != i) {
				int tmp = nums[min];
				nums[min] = nums[i];
				nums[i]= tmp;
			}
		}
		return nums;
	}
}
//超出时间限制

//3.插入排序
class Solution {
	public int[] sortArray(int[] nums){
		for(int i = 1; i < nums.length; i ++){
			int j = i - 1;
			int tmp = nums[i];
			while(j >=0 && nums[j] > tmp){
				nums[j+1] = nums[j];
				j --;
			}
			nums[j+1] = tmp;
		}
		return nums;
	}
}
//579 ms	49.6 MB

//4.归并排序
class Solution {
	public int[] sortArray(int[] nums){
		mergeSort(nums, 0, nums.length-1);
		return nums;
	}

	private void mergeSort(int[] nums, int left, int right){
		if (left < right){
			int middle = (left + right)/2;
			mergeSort(nums, left, middle);
			mergeSort(nums, middle + 1, right);
			merge(nums, left, middle, right);
		}
	}
    private void merge(int []a,int left,int mid,int right){
        int []tmp=new int[a.length];//辅助数组
        int p1=left,p2=mid+1,k=left;//p1、p2是检测指针，k是存放指针
        while(p1<=mid && p2<=right){
            if(a[p1]<=a[p2])
                tmp[k++]=a[p1++];
            else
                tmp[k++]=a[p2++];
        }
        while(p1<=mid) tmp[k++]=a[p1++];//如果第一个序列未检测完，直接将后面所有元素加到合并的序列中
        while(p2<=right) tmp[k++]=a[p2++];//同上
        for (int i = left; i <=right; i++) 
            a[i]=tmp[i];
    }
}
//超出时间限制

 
//5.快速排序
class Solution {
	public int[] sortArray(int[] nums){
		quikSort(nums, 0, nums.length - 1);
		return nums;
	}

	private void quikSort(int[] nums, int left, int right){
		if (left >= right) return;
		int mid = (right - left) / 2;
		int flag = nums[left];
		int i,j;
		i = left;
		j = right;
		while (i < j) {
			while (i<j && nums[j] > flag) j --;
			while (i<j && nums[i] < flag) i ++;
            if (i < j){
            	int tmp = nums[i];
            	nums[j] = nums[i];
            	nums[i] = tmp;
            }
		}
		nums[left] = nums[i];
		nums[i] = flag;
		quikSort(nums, left, j - 1);
		quikSort(nums, j + 1, right);
	}
}
//超出时间限制

//6.桶排序

//7.计数排序

//8.基数排序