

def longest_common_prefix(strs):
    first = strs[0]
    prefix = ""
    for i in range(len(first)):
        for j in range(1, len(strs)):
            if i >= len(strs[j]):
                return prefix                 
            if first[i] != strs[j][i]:
                return prefix
        prefix += first[i]
    return prefix


assert longest_common_prefix(["flower", "flow", "flight"]) == "fl"
assert longest_common_prefix(["dog", "racecar", "car"]) == ""
