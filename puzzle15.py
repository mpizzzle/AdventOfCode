with open('files/puzzle15.txt') as f:
    seeds = [int(line.split(" ")[4]) for line in f.readlines()]

matches = 0
a, b = seeds[0], seeds[1]

for i in range(40000000):
    a = (a * 16807) % 2147483647
    b = (b * 48271) % 2147483647
    if a & 0xffff == b & 0xffff:
        matches += 1

print matches

a, b = seeds[0], seeds[1]
a_candidates, b_candidates = [], []

while len(a_candidates) < 5000000 or len(b_candidates) < 5000000:
    a = (a * 16807) % 2147483647
    b = (b * 48271) % 2147483647
    if a % 4 == 0:
        a_candidates.append(a)
    if b % 8 == 0:
        b_candidates.append(b)

print sum([int(a & 0xffff == b & 0xffff) for a, b in zip(a_candidates, b_candidates)])
