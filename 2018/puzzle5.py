polymer = open('files/puzzle5.txt').read()[0:-1]
polymer_chain = polymer

still_reactive = True

while still_reactive:
    still_reactive = False

    for j in range(26):
        new_polymer = polymer_chain.replace(chr(j + 65) + chr(j + 97), '').replace(chr(j + 97) + chr(j + 65), '')
        if len(new_polymer) != len(polymer_chain):
            polymer_chain = new_polymer
            still_reactive = True

print len(polymer_chain)

current_shortest_polymer = len(polymer_chain)

for i in range(26):
    stripped_polymer = polymer.replace(chr(i + 65), '').replace(chr(i + 97), '')
    still_reactive = True

    while still_reactive:
        still_reactive = False

        for j in range(26):
            new_polymer = stripped_polymer.replace(chr(j + 65) + chr(j + 97), '').replace(chr(j + 97) + chr(j + 65), '')
            if len(new_polymer) != len(stripped_polymer):
                stripped_polymer = new_polymer
                still_reactive = True

    if len(stripped_polymer) < current_shortest_polymer:
        current_shortest_polymer = len(stripped_polymer)

print current_shortest_polymer