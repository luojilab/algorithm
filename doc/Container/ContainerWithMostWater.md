#盛最多水的容器问题
##题干：
   给定一个正整数数组，其组成的容器所能容纳的最大面积

       给定：[1,8,6,2,5,4,8,3,7]
       
 ![](../../res/Container/image_1.jpg)
 
		组成的最大面积就是49
		
##分析
####面积 = 长 x 宽  

随机选中数组中2个值的面积为 = 选中2个数组index的差的绝对值  x  选中2个数组最小value值

###条件：
随机选中数组中2个值不能相同

##方案
使用双指针，一个指向最左，一个指向最右，记录当前的面积最大值。将两个指针中较小的那一个往中间移动。如果值针值相同随机移动一指针

背后原理：当前已经有了一个最大值了，可以看做是当前信息条件下的最优。而能够优化这个问题的办法就是将限制当前值的条件进行改变，尝试寻找更优的解法。

height:1  8  6  2  5  4  8  3  7   

index: 0  1  2  3  4  5  6  7  8   

　　(1) area = |(0 - 8)| * min（1，7） = 8;   
　　(2) area = |(1 - 8)| * min（8，7） = 49;   
　　(3) area = |(1 - 7)| * min（8，3） = 18;   
　　(4) area = |(1 - 6)| * min（8，8） = 40;   
　　(5) area = |(2 - 6)| * min（6，8） = 24;   
　　(6) area = |(3 - 6)| * min（2，8） = 6;   
　　(7) area = |(4 - 6)| * min（5，8） = 10;   
　　(8) area = |(5 - 6)| * min（4，8） = 4;   
　　
###代码
~~~java   
public int maxArea(int[] arr) {
        int leftIndex = 0;
        int rightIndex = height.length - 1;
        int maxContainer = 0;
        while(leftIndex < rightIndex){
            int area =  Math.abs(leftIndex - rightIndex) * Math.min(arr[leftIndex], arr[rightIndex]);
            maxContainer = Math.max(maxContainer,area);
            if(arr[leftIndex] <= arr[rightIndex]){
                leftIndex ++;
            }else{
                rightIndex --;
            }
        }
        return maxContainer;
    }
   
~~~
　　
　　



   
