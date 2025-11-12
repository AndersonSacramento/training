
def len_longest_substring(s):
    c_index = {}        
    start = 0
    end = 0
    len_max = 0
    if len(s) == 0 or len(s) == 1:
        return len(s)
    for i,c in enumerate(s):
        if c in c_index:
            if len_max < i - start:
                len_max =  i - start
            if c_index[c] >= start:
                start = c_index[c] + 1
        c_index[c] = i
    if len_max < (i + 1 - start):
        len_max = i + 1 - start

    return len_max

assert len_longest_substring("abcabcbb") == 3
assert len_longest_substring("abcaxyzuv") == 8
assert len_longest_substring('pwwkew') == 3
assert len_longest_substring('au') == 2
assert len_longest_substring('bbb') == 1
assert len_longest_substring('aab') == 2
assert len_longest_substring('cdd') == 2
assert len_longest_substring('abba') == 2
assert len_longest_substring('ohomm') == 3
