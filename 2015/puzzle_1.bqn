#! /usr/bin/env BQN

input ← ⊑ •FLines "files/1.txt"

b ← 1 -˜ 2 × '(' = input

•Show +´b #part 1
•Show 1 + ⊑/0 > +`b #part 2
