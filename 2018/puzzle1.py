from sets import Set

with open('files/puzzle1.txt') as f:
    file = f.readlines()

#frequency = sum([int(s[1:]) if s[0] == '+' else int(s[1:]) * -1 for s in file])
frequency = 0
frequencies = Set()
frequency_not_found = True
while frequency_not_found:
    for s in file:
        frequencies.add(frequency)
        frequency += int(s[1:]) if s[0] == '+' else int(s[1:]) * -1
        if frequency in frequencies:
    	    frequency_not_found = False
            break

    print frequency