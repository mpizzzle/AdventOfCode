from sets import Set

with open('files/puzzle4.txt') as f:
    file = f.readlines()

valid_passphrases = 0
non_anagram_passphrases = 0

for line in file:
	words = line[:len(line) - 1].split(" ")
	words_sorted = [''.join(sorted(word)) for word in line[:len(line) - 1].split(" ")]
	my_set = Set(words)
	my_sorted_set = Set(words_sorted)
	if len(my_set) == len(words):
		valid_passphrases += 1
	if len(my_sorted_set) == len(words_sorted):
		non_anagram_passphrases += 1

print valid_passphrases
print non_anagram_passphrases