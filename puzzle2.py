with open('puzzle2.txt') as f:
    file = f.readlines()

sum = 0
for line in file:
    my_list = [int(number) for number in line[:len(line) - 1].split('\t')]
    sum += max(my_list) - min(my_list)

print sum
