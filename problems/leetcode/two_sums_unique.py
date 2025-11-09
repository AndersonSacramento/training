


def two_sum_unique(nums, target):
    expected_index = dict()

    for i,n in enumerate(nums):
        if n in expected_index:
            return [expected_index[n], i]
        else:
            expected_index[target-n] = i

    for i,n in enumerate(nums):
        if n in expected_index:
            return [i, expected_index[n]]


        
assert two_sum_unique([2, 7, 11, 15], 9) == [0, 1]
assert two_sum_unique([3, 2, 4], 6) == [1, 2]
assert two_sum_unique([3, 3], 6) == [0, 1]
