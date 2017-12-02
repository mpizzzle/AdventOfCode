with open('files/puzzle1.txt') as f:
    file = f.read()[:len(f.read()) - 1]

print sum([ord(file[i]) - 48 if file[i] == file[(i + 1) % len(file)] else 0 for i in range(len(file))])
