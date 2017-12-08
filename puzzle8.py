with open('files/puzzle8.txt') as f:
    instructions = f.readlines()

registers = {}
max_register = 0

for line in instructions:
	tokens = line.split(" ")

	if tokens[0] not in registers:
		registers[tokens[0]] = 0
	if tokens[4] not in registers:
		registers[tokens[4]] = 0

	value = int(tokens[2])
	if tokens[1] == "dec":
		value *= -1

	modify_register = False

	if tokens[5] == "<":
		modify_register = registers[tokens[4]] <  int(tokens[6])
	if tokens[5] == ">":
		modify_register = registers[tokens[4]] >  int(tokens[6])
	if tokens[5] == "<=":
		modify_register = registers[tokens[4]] <= int(tokens[6])
	if tokens[5] == ">=":
		modify_register = registers[tokens[4]] >= int(tokens[6])
	if tokens[5] == "==":
		modify_register = registers[tokens[4]] == int(tokens[6])
	if tokens[5] == "!=":
		modify_register = registers[tokens[4]] != int(tokens[6])

	if modify_register:
		registers[tokens[0]] += value
	if max(registers.values()) > max_register:
		max_register = max(registers.values())

print max(registers.values())
print max_register