

def remove_element(nums, val):
    i = 0
    j = len(nums) - 1
    while i <= j:
        if nums[i] == val:
            if nums[j] != val:
                nums[i] = nums[j]
                nums[j] = '_'
                i += 1                                         
            else:
                nums[j] = '_'
            j -= 1
        else:
            i += 1
    return i

nums = [3, 2, 2, 3]
assert remove_element(nums, 3) == 2
assert nums == [2, 2, '_', '_']

nums = [0,1,2,2,3,0,4,2]
assert remove_element(nums, 2) == 5
assert nums == [0, 1, 4, 0, 3, '_', '_', '_']
