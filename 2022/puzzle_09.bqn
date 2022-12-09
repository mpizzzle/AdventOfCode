#! /usr/bin/env BQN

⟨ToInt, Split⟩ ← •Import "idioms.bqn"

input ← ' '⊸Split¨ •FLines "files/9.txt"
dirs ← ⟨0‿1,0‿¯1,¯1‿0,1‿0⟩
labels ← "UDLR"

Parse ← ∾(ToInt∘⊑∘⌽ / ⋈∘(dirs ⊑˜ (/labels ⍷˜ ⊑)))¨
Tail ← (⊣ - ((0⊸≠×1-˜2×0⊸≤) × (⌈´1<|))∘(-´⊣⋈>∘⊢))`

t1 ← Tail +` ⟨0‿0⟩ ∾ Parse input

•Show ≠⍷ t1 # part 1
•Show ≠⍷ Tail⍟8 t1 # part 2
