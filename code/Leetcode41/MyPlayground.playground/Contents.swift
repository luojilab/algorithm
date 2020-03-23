
//var nums = [1, 2, 0]
//var nums = [7, 8, 9, 11, 12]
var nums = [3, 4, -1, 1]

func find(nums: [Int]) -> Int {
    var nums = nums
    for (i, _) in nums.enumerated() {
        while nums[i] > 0 && nums[i] <= nums.count && nums[nums [i] - 1] != nums[i] {
            nums.swapAt(nums[i] - 1, i)
        }
    }

    for (i, _) in nums.enumerated() {
        if (nums[i] != i + 1) {
            return i + 1
        }
    }
    return nums.count + 1
}
print("First Missing Positive :【 \(find(nums: nums)) 】")






