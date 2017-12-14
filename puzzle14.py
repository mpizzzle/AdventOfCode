binary_hash = {"0" : 0, "1" : 1, "2" : 1, "3" : 2, "4" : 1, "5" : 2, "6" : 2, "7" : 3, "8" : 1, "9" : 2, "a" : 2, "b" : 3, "c" : 2, "d" : 3, "e" : 3, "f" : 4}

def round(this_input, this_list, skip, pos):
    for length in this_input:
        twist = reversed([this_list[i % len(this_list)] for i in range(pos[0], pos[0] + length)])
        for i, t in zip(range(pos[0], pos[0] + length), twist):
            this_list[i % len(this_list)] = t
        pos[0] += length + skip[0]
        skip[0] += 1

def knot_hash(this_input):
    this_input.extend([17, 31, 73, 47, 23])
    my_list = [i for i in range(256)]
    skip, pos = [0], [0]

    for i in range(64):
        round(this_input, my_list, skip, pos)

    knot_hash = []

    for block in [my_list[i:i + 16] for i in range(0, len(my_list), 16)]:
        knot_hash.append(chr(reduce(int.__xor__, block)))

    return "".join(knot_hash).encode("hex")

disk = [knot_hash([ord(c) for c in "amgozmfv-" + str(i)]) for i in range(128)]

print sum([binary_hash[c] for c in "".join(disk)])
