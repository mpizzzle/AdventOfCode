from sets import Set

file = open('files/puzzle1.txt').readlines()
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