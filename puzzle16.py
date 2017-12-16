with open('files/puzzle16.txt') as f:
    moves = f.read().split(',')

programs = list("abcdefghijklmnop")
print "".join(programs)

for d in range(1, 1000):
    for move in moves:
        if move[0] == 's':
            programs = programs[len(programs) - int(move[1:]):] + programs[:len(programs) - int(move[1:])]
        if move[0] == 'x':
            indices = [int(i) for i in move[1:].split('/')]
            programs[indices[0]], programs[indices[1]] = programs[indices[1]], programs[indices[0]]
        if move[0] == 'p':
            partners = move[1:].split('/')
            i, j = programs.index(partners[0]), programs.index(partners[1])
            programs[i], programs[j] = programs[j], programs[i]
    print "".join(programs)
    if "".join(programs) == "abcdefghijklmnop":
        break
    if d == 40:
        print "^^^^^^^^^^^^^^^^^^"

print d
print 1000000000 % d
