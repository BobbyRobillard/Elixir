import math

i, j, k = 0, 0, 0


def is_triplet(a, b, c):
    if (math.pow(a, 2) + math.pow(b, 2) == math.pow(c, 2)
        or math.pow(a, 2) + math.pow(c, 2) == math.pow(b, 2)
            or math.pow(b, 2) + math.pow(c, 2) == math.pow(a, 2)):

        return True

    return False


for i in range(1, 1000):
    for j in range(1, 1000):
        for k in range(1, 1000):
            if i + j + k != 1000:
                continue

            if is_triplet(i, j, k):
                print("Found")
                print(str(i*j*k))
                break
