#! /usr/bin/env bqn

input ← > '0' -˜ •FLines "files/8.txt"

T ← 0=(⊒⌈`)˘
P ← ↓⋈·⌽(1⊸+)⊸↑
S ← ×´ (0⊸∊+·+´×`)∘(1↓⊑⊸>)¨

•Show +´+˝ (T ∨ T⌾(⌽˘) ∨ T⌾⍉ ∨ T⌾(⌽˘⍉)) input # part 1
•Show ⌈´⌈˝ { (S P⟜(⊢⊏⍉∘𝕩) ∾ ⊢P⊏⟜𝕩)⌜˜↕≠ 𝕩 } input # part 2
