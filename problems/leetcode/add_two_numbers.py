
from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def make_list_node(list):
    last = None
    for val in reversed(list):
        head = ListNode(val, last)
        last = head
    return head

def to_list(list_node):
    cur = list_node
    vals = []
    while cur:
        vals.append(cur.val)
        cur = cur.next
    return vals
        
class Solution:     
    def add_two_numbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        if not l1 and not l2:
            return None
        elif not l1:
            if l2.val > 9:
                if l2.next:
                    l2.next.val += 1
                else:
                    l2.next = ListNode(1, None)
            return ListNode(l2.val % 10, self.add_two_numbers(l2.next, None))
        elif not l2:
            if l1.val > 9:
                if l1.next:
                    l1.next.val += 1
                else:
                    l1.next = ListNode(1, None)
            return ListNode(l1.val % 10, self.add_two_numbers(l1.next, None))

        if l1.val + l2.val > 9:
            if l1.next:
                l1.next.val += 1
            elif l2.next:
                l2.next.val += 1
            else:
                return ListNode((l1.val + l2.val) % 10, self.add_two_numbers(ListNode(1, None), ListNode(0, None)))
        return ListNode((l1.val + l2.val) % 10, self.add_two_numbers(l1.next, l2.next))


if __name__ == '__main__':
    solution = Solution()


    assert to_list(solution.add_two_numbers(make_list_node([2, 4, 3]),
                                            make_list_node([5, 6, 4]))) == [7, 0, 8]

    assert to_list(solution.add_two_numbers(make_list_node([0]),
                                            make_list_node([0]))) == [0]

    assert to_list(solution.add_two_numbers(make_list_node([9, 9, 9, 9, 9, 9, 9]),
                                            make_list_node([9, 9, 9, 9]))) == [8,9,9,9,0,0,0,1]
