

def min_operations(nums):
    """
        :type nums: List[int]
        :rtype: int
    """
    n_op = 0
    i = 0
    while i <= len(nums) - 3:
        if nums[i] == 0:
            nums[i] = 1 - nums[i]
            nums[i + 1] = 1 - nums[i + 1]
            nums[i + 2] = 1 - nums[i + 2]
            n_op += 1
        i += 1
    if nums[-2] == 0 or nums[-1] == 0:
        return -1
    return n_op

if __name__ == '__main__':
    print(min_operations([0,0,1,0,0,1,1,0,0,1,1,0,1,1,0,0,0,1,1,0]))
    print(min_operations([0,0,0]))
    print(min_operations([0,1,1,1,0,0]))
    print(min_operations([0,1,1,1]))
    print(min_operations([0,1,0,0,0,0,0,1,1,1,1,0,0,1,0]))
    
