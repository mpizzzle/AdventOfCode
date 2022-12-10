#!/usr/bin/env BQN

⟨ToInt, Split, Group⟩ ← •Import "idioms.bqn"

input ← (' '⊸Split)¨ •FLines "files/10.txt"
id ← =⌜˜∘↕40

Parse ← ((1-˜2×('-'≠⊑)) × ToInt∘(('-'=⊑)⊸↓)) 1⊑'0'∾˜⊢
Cycle ← (⍷ ⊑∘⊢ ∾˜ Parse∘⊣ + ⊑∘⊢)∾⊢
Chase ← > ((↕40)∊⊢)∘((↕3)+⊢)¨

cycles ← ⌽ Cycle´ ⌽input ∾˜ ⋈⋈1

•Show +´ ((cycles⊑˜1-˜⊢)¨×⊢) 20+40×↕6 # part 1
•Show > (".#" ⊏˜ (+˝ id × Chase))¨ ¯1 ↓ 40 Group 1-˜cycles # part 2
