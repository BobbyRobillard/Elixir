import math

i, j, k = 0, 0, 0


def is_triplet(a, b, c):
    # print("Pow a: " + str(math.pow(a, 2)))
    # print("Pow b: " + str(math.pow(b, 2)))
    # print("Pow c: " + str(math.pow(c, 2)))
    if (math.pow(a, 2) + math.pow(b, 2) == math.pow(c, 2)
        or math.pow(a, 2) + math.pow(c, 2) == math.pow(b, 2)
            or math.pow(b, 2) + math.pow(c, 2) == math.pow(a, 2)):

        return True

    return False


for i in range(1, 1000):
    for j in range(1, 1000):
        for k in range(1, 1000):
            if i + j + k < 1000:
                continue

            if is_triplet(i, j, k):
                print("Triplet: {0}, {1}, {2}.".format(str(i), str(j), str(k)))
                if i + j + k == 1000:
                    print("Found")
                    print(str(i*j*k))
                    break
