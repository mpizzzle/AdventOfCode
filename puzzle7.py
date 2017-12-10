from sets import Set

class Node:
    def __init__(self, name, weight, children):
        self.name = name
        self.weight = weight
        self.children = children

with open('files/puzzle7.txt') as f:
    programs = f.readlines()

my_dict = {}

for program in programs:
    tokens = program.split(" ")
    node = Node(None, None, None)

    if len(tokens) > 2:
        children = [tokens[i + 3][:len(tokens[i + 3]) - 1] for i in range(len(tokens) - 3)]
        node = Node(tokens[0], int(tokens[1][1 : len(tokens[1]) - 1]), children)
    else:
        node = Node(tokens[0], int(tokens[1][1 : len(tokens[1]) - 2]), None)

    my_dict[node.name] = node

for node in my_dict.values():
    if node.children != None:
        for i in range(len(node.children)):
            node.children[i] = my_dict[node.children[i]]

candidate = ""
highest_node_count = 0

def traverse(node):
    return 1 if node.children == None else 1 + sum([traverse(node.children[i]) for i in range(len(node.children))])

for node in my_dict.values():
    node_count = traverse(node)
    if node_count > highest_node_count:
        highest_node_count = node_count
        candidate = node.name

print candidate

def traverse_totals(node):
    if node.children == None:
        return node.weight

    weights = [traverse_totals(node.children[i]) for i in range(len(node.children))]
    if len(Set(weights)) != 1:
        for idx, weight in enumerate(weights):
            if weights.count(weight) == 1:
                s = list(Set(weights))
                print node.children[idx].weight + s[0] - s[1]
    return node.weight + sum(weights)

traverse_totals(my_dict[candidate])
