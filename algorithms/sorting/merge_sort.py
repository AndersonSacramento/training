


def merge(A, p, q, r):
    L = A[p:q+1]
    R = A[q+1:r+1]
    i, j  = (0, 0)
    for k in range(p, r+1):
        if j >= len(R) or (i < len(L) and  L[i] <= R[j]):
            A[k] = L[i]
            i += 1
        else:
            A[k] = R[j]
            j += 1

def merge_sort(A, p, r):

    if p < r:
        q =  int((p + r)/2) 
        merge_sort(A, p, q)
        merge_sort(A, q+1, r)
        merge(A, p, q, r)


if __name__ == '__main__':

    A = [5, -2, -23, 2, 4, 6, 1, 3, 23, 0]
    merge_sort(A, 0, len(A)-1)
    print(A)
