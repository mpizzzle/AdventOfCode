#! /usr/bin/env BQN

⟨ToInt, Split⟩ ← •Import "idioms.bqn"

input ← ' '⊸Split¨ •FLines "files/9.txt"

dirs ← ⟨0‿1,0‿¯1,¯1‿0,1‿0⟩
labels ← "UDLR"

Parse ← ⟨0‿0⟩∾(∾{ 𝕩⊸(dirs ⊑˜ (/labels ⍷˜ ⊑)∘⊣)¨ (1+↕∘ToInt∘⊑∘⌽) 𝕩 }¨)
Tail ← (⊣ (⊣ - ((0⊸≠×1-˜2×0⊸≤) × (⌈´1<|))∘⊢) (-´ ⊣ ⋈ (> 2⊸⊏)))` ⟨0‿0⟩∾(<˘3⊸↕)

t1 ← Tail +`Parse input

•Show ≠⍷ t1 # part 1
•Show ≠⍷ Tail⍟8 t1  # part 2
