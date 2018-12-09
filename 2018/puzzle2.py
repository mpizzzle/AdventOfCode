file = [s[0:-1] for s in open('files/puzzle2.txt').readlines()]
two_count = 0
three_count = 0

for i, s in enumerate(file):
    letter_table = [0 for idx in range(26)]
    two_count_inc = 0
    three_count_inc = 0

    for c in s:
        letter_table[ord(c) - ord('a')] += 1

    for l in letter_table:
        if l == 2:
            two_count_inc = 1
        if l == 3:
            three_count_inc = 1

    two_count += two_count_inc
    three_count += three_count_inc

    for ss in file[0: i]:
        if sum([a != b for a, b in zip(s, ss)]) == 1:
            print ''.join([a if a == b else '' for a, b in zip(s, ss)])

print two_count * three_count