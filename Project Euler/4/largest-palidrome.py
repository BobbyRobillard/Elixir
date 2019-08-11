largest = 0

def is_palidrome(x):
    str_x = str(x)
    len_x = len(str_x)

    for i in range(0, int(len_x/2)):
        if str_x[i] != str_x[len_x - i - 1]:
            return False

    return True

for i in range(100, 999):
    for j in range(100, 999):
        res = i * j
        if is_palidrome(res) and (res > largest):
            largest = res

print(str("Largest: " + str(largest)))
