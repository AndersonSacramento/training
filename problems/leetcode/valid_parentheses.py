
def is_valid(s: str) -> bool:
    close_stack = []
    for c in s:
        if c == '(':
            close_stack.append(')')
        elif c == '[':
            close_stack.append(']')
        elif c == '{':
            close_stack.append('}')
        else:
            if not close_stack:
                return False
            expected_close = close_stack.pop()
            if expected_close != c:
                return False
    if close_stack:
        return False        
    return True


assert is_valid("()") == True
assert is_valid("()[]{}") == True
assert is_valid("(]") == False
assert is_valid("([)]") == False

    
