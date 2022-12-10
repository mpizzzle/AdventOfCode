#! /usr/bin/env BQN

⟨ToNat, Split⟩ ← •Import "idioms.bqn"

input ← ' '⊸Split¨ •FLines "files/9.txt"
d‿l ← ⟨0‿1,0‿¯1,¯1‿0,1‿0⟩‿"UDLR"

Parse ← ∾(ToNat∘⊑∘⌽ / ⋈∘(d⊑˜/)∘(l⍷˜⊑))¨
Tail ← (⊣ - ((0⊸≠×1-˜2×0⊸≤) × (⌈´1<|))∘(-´⊣⋈>∘⊢))`

t1 ← Tail +` ⟨0‿0⟩ ∾ Parse input

•Show ≠⍷ t1 # part 1
•Show ≠⍷ Tail⍟8 t1 # part 2
