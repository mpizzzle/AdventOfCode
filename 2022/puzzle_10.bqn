#!/usr/bin/env BQN

⟨ToInt, Split⟩ ← •Import "idioms.bqn"

input ← (' '⊸Split)¨ •FLines "files/10.txt"

Parse ← ((1-˜2×('-'≠⊑)) × ToInt∘(('-'=⊑)⊸↓)) 1⊑'0'∾˜⊢
Cycle ← (⍷ ⊑∘⊢ ∾˜ Parse∘⊣ + ⊑∘⊢)∾⊢

cycles ← ⌽Cycle´⌽input∾˜⋈⋈1
strengths ← 20‿60‿100‿140‿180‿220

•Show +´ ((cycles⊑˜1-˜⊢)¨ × ⊢) strengths # part 1

id ← =⌜˜∘↕40

•Show >(".#" ⊏˜ (+˝id×(> ((↕40)∊(↕3)+⊢)¨)))¨ ¯1 ↓ 40 (⌊∘÷˜⟜(↕≠)⊔⊢) 1-˜cycles # part 2
