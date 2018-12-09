file = sorted(open('files/puzzle4.txt').readlines())
guards = {}
current_guard = ""
start = 0

for line in file:
    if '#' in line:
        current_guard = line.split('#')[1].split(' ')[0]
        if current_guard not in guards:
            guards[current_guard] = [0 for idx in range(60)]
    else:
        seconds = int(line.split(']')[0].split(':')[1])
        if "falls asleep" in line:
            start = seconds
        else:
            for second in range(start, seconds):
                guards[current_guard][second] += 1

sleepiest_guard = ""
current_total = 0
most_predictable_guard = ""
current_frequency = 0

for guard, seconds in guards.items():
    total = sum(seconds)
    frequency = max(seconds)

    if total > current_total:
        current_total = total
        sleepiest_guard = guard

    if frequency > current_frequency:
        current_frequency = frequency
        most_predictable_guard = guard

print int(sleepiest_guard) * guards[sleepiest_guard].index(max(guards[sleepiest_guard]))
print int(most_predictable_guard) * guards[most_predictable_guard].index(max(guards[most_predictable_guard]))