import sys

with open('files/puzzle10.txt') as f:
    blep = f.read()
    puzzle_input = [int(c) for c in blep.split(',')]
    puzzle_ascii = ""
    if len(sys.argv) > 1:
        puzzle_ascii = [ord(c) for c in sys.argv[1]]
    else:
        puzzle_ascii = [ord(c) for c in blep[:len(blep) - 1]]
    puzzle_ascii.extend([17, 31, 73, 47, 23])

def round(this_input, this_list, skip, pos):
    for length in this_input:
        twist = reversed([this_list[i % len(this_list)] for i in range(pos[0], pos[0] + length)])
        for i, t in zip(range(pos[0], pos[0] + length), twist):
            this_list[i % len(this_list)] = t
        pos[0] += length + skip[0]
        skip[0] += 1

my_list = [i for i in range(256)]
round(puzzle_input, my_list, [0], [0])
#print my_list[0] * my_list[1]

my_list = [i for i in range(256)]
skip, pos = [0], [0]

for i in range(64):
    round(puzzle_ascii, my_list, skip, pos)

knot_hash = []

for block in [my_list[i:i + 16] for i in range(0, len(my_list), 16)]:
    knot_hash.append(chr(reduce(lambda x, y: x ^ y, block)))

print "".join(knot_hash).encode("base64")
