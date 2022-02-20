#!/usr/bin/env BQN

input ← •FLines "files/16.txt"

aunt ← ⟨
  "children: 3",
  #"cats: 7",
  "samoyeds: 2",
  #"pomeranians: 3",
  "akitas: 0",
  "vizslas: 0",
  #"goldfish: 5",
  #"trees: 3",
  "cars: 2",
  "perfumes: 1"
⟩

Format ← ⥊(∾1⊸↑∾' '∾¯1⊸↑)¨∘(⋈˘(0‿2‿4 ⊏ 2⊸↕))∘(2↓(' '⊸((⊢-˜+`×¬)∘=⊔⊢)','⊸≠⊸/))

1 + / 2 = +´∘(aunt⊸∊)∘Format ¨ input # parts 1 & 2 (narrowed down to 5 possibilities)
