from typing import List, Tuple

def binary_search(nums: List[int], r: Tuple[int , int]):
    nCounts = r[1] - r[0]
    if nCounts == 1:
        return r[0]
    if nCounts % 2 == 1:
        mid = (r[0] + r[1]) // 2
        nLessEqualMid = len(list(filter(lambda x: r[0] <= x <= mid, nums)))
        nGreaterEqualMid = len(list(filter(lambda x: r[1] > x >= mid, nums)))
        if nLessEqualMid == nGreaterEqualMid:
            return mid
        else:
            return binary_search(nums, (r[0], mid + 1) if nLessEqualMid > nGreaterEqualMid else (mid, r[1]))
    if nCounts % 2 == 0:
        mid = (r[0] + r[1]) // 2
        nLessMid = len(list(filter(lambda x: r[0] <= x < mid, nums)))
        nGreaterMid = len(list(filter(lambda x: r[1] > x >= mid, nums)))
        return binary_search(nums, (r[0], mid) if nLessMid > nGreaterMid else (mid, r[1]))

def loop_list(nums: List[int]):
    fast = 0
    slow = 0
    while True:
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast:
            break
    slow = 0
    while True:
        slow = nums[slow]
        fast = nums[fast]
        if slow == fast:
            break
    return slow

if __name__ == "__main__":
    nums = [1,1]
    print(binary_search(nums, (1, 2)), loop_list(nums))
    
        