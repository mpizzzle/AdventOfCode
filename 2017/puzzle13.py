firewall = []
idx = 0

with open('files/puzzle13.txt') as f:
    for line in f.readlines():
        tokens = line.split(' ')

        if idx is not int(tokens[0][:len(tokens[0]) - 1]):
            while idx < int(tokens[0][:len(tokens[0]) - 1]):
                firewall.append(0)
                idx += 1

        firewall.append(int(tokens[1]))
        idx += 1

def generate_sequence(x, delay):
    sequence = []
    reverse = False

    for i in range(len(firewall) + delay):
        sequence.append((x - 1) - (i % (x - 1)) if reverse else i % (x - 1))
        if (i + 1) % (x - 1) == 0:
            reverse = not reverse

    return sequence

scanner_sequences = {i : generate_sequence(i, 0) for i in range(2, 100)}
severity = 0

for picoseconds, wall in enumerate(firewall):
    if wall != 0:
        if scanner_sequences[wall][picoseconds] == 0:
            severity += wall * picoseconds

print severity

def generate_scanner_position(wall, pos):
    reverse = False

    for i in range(pos):
        if (i + 1) % (wall - 1) == 0:
            reverse = not reverse

    return (wall - 1) - (pos % (wall - 1)) if reverse else delay % (wall - 1)

delay = 0
caught = True
furthest = 0
while caught:
    caught = False
    delay += 1
    for picoseconds, wall in enumerate(firewall):
        if wall != 0:
            print generate_scanner_position(wall, picoseconds + delay)
            if generate_scanner_position(wall, picoseconds + delay) == 0:
                if picoseconds > furthest:
                    furthest = picoseconds
                    print "current furthest: " + str(furthest)
                caught = True
                break

print delay
