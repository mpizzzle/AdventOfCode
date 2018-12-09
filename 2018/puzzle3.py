file = [s[0:-1] for s in open('files/puzzle3.txt').readlines()]
fabric = [[0 for idx in range(1000)] for jdx in range(1000)]

for line in file:
    tokens = line.split(',')
    start_x = int(tokens[0].split('@')[1])
    temp = tokens[1].split(':')
    start_y = int(temp[0])
    temp2 = temp[1].split('x')
    for x in range(start_x, start_x + int(temp2[0])):
        for y in range(start_y, start_y + int(temp2[1])):
            fabric[x][y] += 1

print sum([sum([1 if y > 1 else 0 for y in x]) for x in fabric])

for line in file:
    tokens = line.split(',')
    start_x = int(tokens[0].split('@')[1])
    temp = tokens[1].split(':')
    start_y = int(temp[0])
    temp2 = temp[1].split('x')
    claim_found = True
    for x in range(start_x, start_x + int(temp2[0])):
        for y in range(start_y, start_y + int(temp2[1])):
            if fabric[x][y] > 1:
                claim_found = False

    if claim_found:
        print line
        break