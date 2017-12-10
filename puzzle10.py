with open('files/puzzle10.txt') as f:
    puzzle_input = [int(c) for c in f.read().split(',')]

my_list = [i for i in range(256)]
skip, pos = 0, 0

for length in puzzle_input:
    twist = reversed([my_list[i % len(my_list)] for i in range(pos, pos + length)])
    for i, t in zip(range(pos, pos + length), twist):
        my_list[i % len(my_list)] = t
    pos += length + skip
    skip += 1

print my_list[0] * my_list[1]
