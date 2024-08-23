from typing import List


class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:        
        output = set()
        nums.sort()


        for i in  range(len(nums)):
            s = set()
            for j in range(i+1, len(nums)):
                third = -(nums[i] + nums[j])
                if third in s:
                    temp =  [nums[i], nums[j], third]
                    temp.sort()
                    output.add(tuple(temp))
                s.add(nums[j])
            
        return list(output)

    
if __name__ == '__main__':
    s = Solution()
    print(s.threeSum([-1,0,1,2,-1,-4, -8, 9, 10]))
    print(s.threeSum([0,0,0]))
    print(s.threeSum([0,1,2,3]))
    print(s.threeSum([-1,0,1,2,-1,-4,-2,-3,3,0,4]))

