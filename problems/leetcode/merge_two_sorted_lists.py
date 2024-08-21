from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

         
class Solution:
    
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        if not list1:
            return list2
        if not list2:
            return list1
        
        if list1.val <= list2.val:
            list1.next = self.mergeTwoLists(list1.next, list2)
            return list1
        else:
            list2.next = self.mergeTwoLists(list1, list2.next)
            return list2

def list_node_to_list(list_node):
    output = []

    while list_node:
        output.append(list_node.val)
        list_node = list_node.next
    return output

if __name__ == '__main__':

    list1 = ListNode(1, ListNode(2, ListNode(4)))
    list2 = ListNode(1, ListNode(3, ListNode(4)))

    solution1 = Solution().mergeTwoLists(list1, list2)

    output1 = list_node_to_list(solution1)

    assert output1 == [1, 1, 2, 3, 4, 4]
