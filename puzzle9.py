from sets import Set

with open('files/puzzle9.txt') as f:
    stream = list(f.read())

garbage = False
skip = False
depth = 0
total = 0
garbage_characters = 0

for char in stream:
    if not garbage:
        if char == '{':
            depth += 1
            total += depth
        if char == '}':
            depth -= 1
        if char == '<':
            garbage = True
    else:
        if not skip:
            if char == '!':
                skip = True
                continue
            if char == '>':
                garbage = False
            else:
                garbage_characters += 1
        else:
            skip = False

print total
print garbage_characters
