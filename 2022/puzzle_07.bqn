#! /usr/bin/env BQN

⟨ToInt, Part, Digits⟩ ← •Import "idioms.bqn"

input ← •FLines "files/7.txt"
dirs ← "$ cd"⊸(⌈´⊣⊸⍷)¨ input

traversed ← (((1-≠)∘⊢↓⊣)∾((1-˜≠)∘⊢↓⊢))` dirs Part input
totals ← +´¨(ToInt/∘Digits⊸⊏)¨¨ dirs ¬⊸Part input
results ← <∘(+´totals ⊏˜/)˘ (1×+´∘⍷)⌜˜ traversed

•Show +´ (/⊢ ≤ 100000˙)⊸⊏˜ results # part 1
•Show ⌊´ (/⊢ ≥ 40000000 -˜ ⊑)⊸⊏˜ results # part 2
