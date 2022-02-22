#!/usr/bin/env BQN

input ← •FLines "files/15.txt"

Partition ← •BQN ¨ 1↓ (¬2|↕11) / ' '((⊢-˜+`×¬)∘=⊔⊢)','⊸≠⊸/

Add ← ⊣>⊸+≠⊸/⟜≍
Find ← ⊢/˜(⌈´0<×´×0<⊢)˘
Optimize ← ∾<˘/˜⟜(⊢=⌈´)(×´¯1⊸↓)˘

i ← Partition ¨ input
diff ← <∘-´˘ ⊏⟜i ⎉ 0 (⊢ /˜ (⍷≡⊢)¨) ⥊ ⋈⌜˜ ↕4
guess ← >10 × +´ ⊏⟜i ¨ 1‿0‿0‿3‿3‿3‿3‿2‿2‿2 # guess by hand

•Show ×´¯1↓ diff Optimize∘Find∘Add ⍟ 10 guess # part 1
