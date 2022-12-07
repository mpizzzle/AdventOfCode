#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"

input ← (/¬∘(⌈´"$ ls"⊸⍷)¨)⊸⊏ •FLines "files/7.txt"
cd ← (⌈´"$ cd"⊸⍷) ¨ input

dirs ← (((¯1×1-˜≠)∘⊢↓⊣)∾((1-˜≠)∘⊢↓⊢))` cd Part input 
totals ← (+´(ToInt⊢⊏˜(/('0'+↕10)∊˜⊢))¨)¨ cd ¬⊸Part input 
results ← <∘(+´totals ⊏˜/)˘ (1×+´∘⍷)⌜˜ dirs

•Show +´ (/⊢ ≤ 100000˙)⊸⊏˜ results # part 1
•Show ⌊´ (/⊢ ≥ 40000000 -˜ ⊑)⊸⊏˜ results # part 2
