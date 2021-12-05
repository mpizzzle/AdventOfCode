from sets import Set

with open('files/puzzle9.txt') as f:
    stream = list(f.read())

garbage = False
skip = False
depth = 0
total = 0
garbage_characters = 0

for char in stream:
    if garbage:
        if skip:
            skip = False
        else:
            if char == '!':
                skip = True
                continue
            if char == '>':
                garbage = False
            else:
                garbage_characters += 1
    else:
        if char == '{':
            depth += 1
            total += depth
        if char == '}':
            depth -= 1
        if char == '<':
            garbage = True

print total
print garbage_characters
