from sets import Set

with open('files/puzzle1.txt') as f:
    file = f.readlines()

frequency = 0
frequencies = Set()
frequency_found = False

while not frequency_found:
    for s in file:
        frequencies.add(frequency)
        frequency += int(s)
        if frequency in frequencies:
            frequency_found = True
            break

    print frequency