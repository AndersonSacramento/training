

def insertion_sort(A):
    for i in range(1, len(A)):
        c = A[i]
        j = i - 1
        while j >= 0 and c < A[j]:
            A[j+1] = A[j]
            j -= 1
        A[j+1] = c


# Initialization: It is true prior to o the first iteration of the loop.
# Maintenance: If it is true before an iteration of the loop, it remains true before the next iteration
# Termination: When  the loop terminates, the invariant gives us an useful property that helps show that the algorithm is correct.

if __name__ == '__main__':

    A = [5, 2, 4, 6, 1, 3]
    insertion_sort(A)
    print(A)
