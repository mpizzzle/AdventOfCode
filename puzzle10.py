with open('files/puzzle10.txt') as f:
    blep = f.read()
    puzzle_input = [int(c) for c in blep.split(',')]
    puzzle_ascii = [ord(c) for c in blep[:len(blep) - 1]]
    puzzle_ascii.extend([17, 31, 73, 47, 23])

my_list = [i for i in range(256)]
skip, pos = 0, 0

for length in puzzle_input:
    twist = reversed([my_list[i % len(my_list)] for i in range(pos, pos + length)])
    for i, t in zip(range(pos, pos + length), twist):
        my_list[i % len(my_list)] = t
    pos += length + skip
    skip += 1

print my_list[0] * my_list[1]

my_list = [i for i in range(256)]
skip, pos = 0, 0

for i in range(64):
    for length in puzzle_ascii:
        twist = reversed([my_list[i % len(my_list)] for i in range(pos, pos + length)])
        for i, t in zip(range(pos, pos + length), twist):
            my_list[i % len(my_list)] = t
        pos += length + skip
        skip += 1

blocks = [my_list[i:i + 16] for i in range(0, len(my_list), 16)]

knot_hash = []

for block in blocks:
    value = 0
    for i in block:
        value ^= i
    knot_hash.append(chr(value))

print "".join(knot_hash).encode("hex")
