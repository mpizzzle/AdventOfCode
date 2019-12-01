file = open('files/puzzle1.txt').readlines()

print(sum([int(int(mass) / 3) - 2 for mass in file]))

def calculate_fuel(mass):
    fuel = int(mass / 3) - 2
    return fuel + calculate_fuel(fuel) if fuel > 0 else 0

print(sum([calculate_fuel(int(mass)) for mass in file]))
