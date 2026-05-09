

def peakfind(list):
    size = len(list)
    if size == 0:
        -1, -1
    elif size == 1:
        list[0], 0
        
    def _peakfind(list, i, j):
        middle_pos = (i + j) // 2

        if (i < middle_pos) and (list[middle_pos - 1] > list[middle_pos]):
            return _peakfind(list, i, middle_pos - 1)
        elif (j > middle_pos) and (list[middle_pos + 1] > list[middle_pos]):
            return _peakfind(list, middle_pos + 1, j)
        else:
            return list[middle_pos], middle_pos
        
    return _peakfind(list, 0, size - 1)
                                     

    
def peakfind_value(list):
    if size == 1:
        return list[0]
    middle_pos = int(size/2)
    if list[middle_pos] < list[middle_pos - 1]:
        return peakfind_value(list[:middle_pos])
    elif size > middle_pos + 1 and list[middle_pos] < list[middle_pos + 1]:
        return peakfind_value(list[middle_pos + 1:])
    else:
        return list[middle_pos]



if __name__ == '__main__':
    assert peakfind([0, 0]) == (0, 0)
    assert peakfind([12, 14]) == (14, 1)
    assert peakfind([21, 3221, 14]) == (3221, 1)
    assert peakfind([12, 12, 12, 13, 13, 13, 18, 11]) == (13, 3)
    assert peakfind([13, 13, 13, 18, 11]) == (18, 3)
    assert peakfind([13, 13, 13, 18, 21, 22, 23, 89, 11]) == (89, 7)
    assert peakfind([1]) == (1, 0)
