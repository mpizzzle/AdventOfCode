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

def traverse(node, network):
    network.append(node)
    x_y = [int(n) for n in node.split(',')]
    neighbours = [str(x_y[0]) + ',' + str(x_y[1] - 1), str(x_y[0]) + ',' + str(x_y[1] + 1), str(x_y[0] - 1) + ',' + str(x_y[1]), str(x_y[0] + 1) + ',' + str(x_y[1])]
    for neighbour in neighbours:
        if neighbour not in network:
            if neighbour in disk_hash:
                if disk_hash[neighbour]:
                    traverse(neighbour, network)

network = []
size_of_network = 0
network_count = 0
binary_disk = ["".join(["".join([str(int(int(c, 16) & 2**i > 0)) for i in reversed(range(4))]) for c in row]) for row in disk]
disk_hash = {}

for x in range(128):
    for y in range(128):
        disk_hash[str(x) + ',' + str(y)] = int(binary_disk[x][y])

for node in disk_hash.keys():
    if disk_hash[node] and node not in network:
        traverse(node, network)
        if len(network) > size_of_network:
            size_of_network = len(network)
            network_count += 1

print network_count
