

def selection_sort(A):
    for i in range(len(A)):
        smaller_index = i
        for j in range(i+1, len(A)):
            if A[j] < A[smaller_index]:
                smaller_index = j
        cur = A[i]
        A[i] = A[smaller_index]
        A[smaller_index] = cur


if __name__ == '__main__':

    A = [5, 2, 4, 6, 1, 3]
    selection_sort(A)
    print(A)
