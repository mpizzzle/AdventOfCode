with open('files/puzzle18.txt') as f:
    instructions = f.readlines()

ptr = 0
last_played_value = 0
registers = {chr(i + 97) : 0 for i in range(26)}

while ptr >= 0 and ptr < len(instructions):
    tokens = instructions[ptr].strip().split(" ")

    if tokens[0] == "snd":
        last_played_value = registers[tokens[1]]
    if tokens[0] == "rcv" and registers[tokens[1]] > 0:
        break
    if tokens[0] == "set":
        registers[tokens[1]] = int(tokens[2]) if not str.isalpha(tokens[2]) else registers[tokens[2]]
    if tokens[0] == "add":
        registers[tokens[1]] += int(tokens[2]) if not str.isalpha(tokens[2]) else registers[tokens[2]]
    if tokens[0] == "mul":
        registers[tokens[1]] *= int(tokens[2]) if not str.isalpha(tokens[2]) else registers[tokens[2]]
    if tokens[0] == "mod":
        registers[tokens[1]] %= int(tokens[2]) if not str.isalpha(tokens[2]) else registers[tokens[2]]
    if tokens[0] == "jgz" and registers[tokens[1]] > 0:
        ptr += int(tokens[2]) if not str.isalpha(tokens[2]) else registers[tokens[2]]
        continue
    ptr += 1

print last_played_value
