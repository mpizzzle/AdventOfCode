with open('files/puzzle2.txt') as f:
    file = f.readlines()

sum_difference = 0
sum_division = 0

for line in file:
    my_list = sorted([int(number) for number in line[:len(line) - 1].split('\t')])
    sum_difference += max(my_list) - min(my_list)
    sum_division += sum([sum([j / i if i < j and j % i == 0 else 0 for j in my_list]) for i in my_list])

print sum_difference
print sum_division
