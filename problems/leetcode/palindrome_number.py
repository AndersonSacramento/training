import math

def is_palindrome(x):
    """Given an integer x, return true if x is a palindrome, and false otherwise."""

    if x < 0:
        return False
    mag = order_of_magnitude(x)
    i = 1
    while i <= mag:
        left_digit = (x // (10 ** mag)) % 10
        right_digit = (x % (10 ** i)) // (10 ** (i-1))
        if left_digit != right_digit:
            return False
        mag -= 1
        i += 1
    return True

def order_of_magnitude(x):
    return math.floor(math.log10(abs(x)))

if __name__ == '__main__':
    assert is_palindrome(121) == True
    assert is_palindrome(-121) == False
    assert is_palindrome(10) == False
    assert is_palindrome(111) == True
    assert is_palindrome(3223) == True
    assert is_palindrome(32223) == True
    assert is_palindrome(1000021) == False
    assert is_palindrome(10022201) == False
