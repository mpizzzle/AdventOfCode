with open('files/puzzle12.txt') as f:
    programs = f.readlines()

my_dict = {}
network = []

for program in programs:
    tokens = program.split(" ")
    my_dict[tokens[0]] = [tokens[i][:len(tokens[i]) - 1] for i in range(2, len(tokens))]

def traverse(recipients):
    for recipient in recipients:
        if recipient not in network:
            network.append(recipient)
            traverse(my_dict[recipient])

traverse(my_dict["0"])
print len(network)

size_of_network = len(network)
network_count = 1

for program in my_dict.values():
    traverse(program)
    if len(network) > size_of_network:
        size_of_network = len(network)
        network_count += 1

print network_count
