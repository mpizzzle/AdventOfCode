from sets import Set

with open('files/puzzle5.txt') as f:
    instructions = [int(i) for i in f.readlines()]

pointer = 0
step_counter = 0

while pointer < len(instructions):
	temp = pointer
	pointer += instructions[pointer]
	instructions[temp] += 1
	step_counter += 1

print step_counter