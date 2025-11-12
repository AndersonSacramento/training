
def len_longest_substring(s):
    c_index = {}        
    start = 0
    len_max = 0
    if len(s) == 0 or len(s) == 1:
        return len(s)
    for i,c in enumerate(s):
        # the char have been detected on the substring already
        if c in c_index:
            # check if the substring up to the repeated
            # char position is bigger than the current
            # biggest length substring
            if len_max < i - start:
                # update the biggest substring length
                len_max =  i - start
            # check if the previous char position
            # is bigger than the start position on string
            if c_index[c] >= start:
                # update the start position to not repeat
                # the char c on substring going to the
                # next position after the previous c position
                start = c_index[c] + 1
        # always update the c position on index
        # to measure substring from left to right
        c_index[c] = i
    # check if start to i position length is bigger than len_max
    # it can be in case of not index hit after last, if any,
    # len_max calculation
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
