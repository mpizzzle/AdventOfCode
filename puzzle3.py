idx = 1

while idx ** 2 < 312051:
    idx += 2

print idx - (idx / 2) + (idx ** 2 - (idx / 2) - 312051) - 1

x, y, steps = 0, 0, 0
x_dir, y_dir, length = 1, 1, 1
vert = False
next_tile = "null"
spiral_dict = {"0 0" : 1, next_tile : 0}

def key_check(key):
    return key if key in spiral_dict else "null"

while spiral_dict[next_tile] < 312051:
    value = 0
    x = x + (int(not vert) * x_dir)
    y = y + (int(vert) * y_dir)

    value += spiral_dict[key_check(str(x + 1) + " " + str(y))]
    value += spiral_dict[key_check(str(x - 1) + " " + str(y))]
    value += spiral_dict[key_check(str(x) + " " + str(y + 1))]
    value += spiral_dict[key_check(str(x) + " " + str(y - 1))]
    value += spiral_dict[key_check(str(x + 1) + " " + str(y + 1))]
    value += spiral_dict[key_check(str(x + 1) + " " + str(y - 1))]
    value += spiral_dict[key_check(str(x - 1) + " " + str(y + 1))]
    value += spiral_dict[key_check(str(x - 1) + " " + str(y - 1))]

    next_tile = str(x) + " " + str(y)
    spiral_dict[next_tile] = value
    steps += 1

    if steps == length:
        if vert:
            length += 1
            x_dir *= -1
            y_dir *= -1
        vert = not vert
        steps = 0

print spiral_dict[next_tile]
