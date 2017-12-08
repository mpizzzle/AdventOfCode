from sets import Set

with open('files/puzzle5.txt') as f:
    instructions = [int(i) for i in f.readlines()]

pointer = 0
step_counter = 0
instructions2 = list(instructions)

while pointer < len(instructions):
	temp = pointer
	pointer += instructions[pointer]
	instructions[temp] += 1
	step_counter += 1

print step_counter

pointer = 0
step_counter = 0

while pointer < len(instructions2):
	temp = pointer
	pointer += instructions2[pointer]
	if instructions2[temp] >= 3:
		instructions2[temp] -= 1
	else:
		instructions2[temp] += 1
	step_counter += 1

print step_counter