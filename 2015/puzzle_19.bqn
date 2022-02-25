#!/usr/bin/env BQN

input ← •FLines "files/19.txt"

Format ← 1‿0‿1 / ' '((⊢-˜+`×¬)∘=⊔⊢)⊢

S ← ≠∘⊢/⋈∘⊣
I ← ⊢S˜↕∘≠∘⊣
H ← ⊣(⊣(⊢+I)/∘⍷)˜0⊸⊑
F ← ⊣H(⊣S˜⋈)1⊑⊢
G ← (⊢/˜0<≠¨)⊣((⊢∊¨˜I)((⊢-˜+`×¬)⊸⊔)¨S)H
GetMolecules ← (∾⌽ ⌾ (2⊸↑)) ¨ F ∾¨ G

•Show ≠⍷∾ (¯1 ⊑ input)⊸GetMolecules¨ (Format ¨ ¯2↓input) # part 1
