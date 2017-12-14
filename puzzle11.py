x, y = [0.0], [0.0]

def find_least_steps(direction):
    step(direction)
    cur_x, cur_y = x[0], y[0]
    steps = 0

    while x[0] != 0:
        if x[0] < 0:
            if y[0] < 0:
                step("ne")
            else:
                step("se")
        else:
            if y[0] < 0:
                step("nw")
            else:
                step("sw")
        steps += 1
    while y[0] != 0:
        if y[0] < 0:
            step("n")
        else:
            step("s")
        steps += 1

    x[0], y[0] = cur_x, cur_y
    return steps

def step(direction):
    if direction == "n":
        y[0] += 1
    if direction == "s":
        y[0] -= 1
    if direction == "nw":
        x[0] -= 1
        y[0] += 0.5
    if direction == "ne":
        x[0] += 1
        y[0] += 0.5
    if direction == "sw":
        x[0] -= 1
        y[0] -= 0.5
    if direction == "se":
        x[0] += 1
        y[0] -= 0.5

with open('files/puzzle11.txt') as f:
    furthest_steps = max([find_least_steps(direction) for direction in f.read().strip().split(',')])

print find_least_steps("")
print furthest_steps
