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

def generate_sequence(x):
    sequence = []
    reverse = False

    for i in range(len(firewall)):
        sequence.append((x - 1) - (i % (x - 1)) if reverse else i % (x - 1))
        if (i + 1) % (x - 1) == 0:
            reverse = not reverse

    return sequence

scanner_sequences = {}
severity = 0

for picoseconds, wall in enumerate(firewall):
    if wall != 0:
        if wall not in scanner_sequences:
            scanner_sequences[wall] = generate_sequence(wall)
        if scanner_sequences[wall][picoseconds] == 0:
            severity += wall * picoseconds

print severity
