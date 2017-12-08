with open('files/puzzle6.txt') as f:
    memory_banks = [int(i) for i in f.read().split('\t')]

cycles = 0
my_map = {}

while "".join([str(bank) for bank in memory_banks]) not in my_map:
	my_map["".join([str(bank) for bank in memory_banks])] = cycles

	for idx, bank in enumerate(memory_banks):
		if bank == max(memory_banks):
			memory_banks[idx] = 0
			for i in range(bank):
				memory_banks[(i + idx + 1) % len(memory_banks)] += 1
			break
	cycles += 1

print cycles
print cycles - my_map["".join([str(bank) for bank in memory_banks])]