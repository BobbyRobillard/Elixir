import math

powers = []

for i in range(2, 101):
    for j in range(2, 101):
        result = math.pow(i, j)
        if result not in powers:
            powers.append(result)

print("Length: {0}".format(str(len(powers))))
