#! /usr/bin/env bqn

⟨ToNat, Part⟩ ← •Import "idioms.bqn"

input ← •FLines "files/3.txt"

pad ← ¯1‿¯1 ⌽ (⊢↑˜2‿2+≢) > input
P ←  Part○(∾<˘)

n ←  ≍¨ '0' + ↕10
nm ← ∨´ ⍷⟜pad¨ n
sm ← ¬ ∨´ ⍷⟜pad¨ n ∾ " ."
nats‿l ← <˘⍉> (ToNat⋈≠)¨ nm P pad
lc ← ⍉ l ≍ ⊑¨ nm P ↕≢pad

•Show +´ nats /˜ (3⋈2⊸+)⊸(∨´·∨˝↑)⟜(sm⌽˜1‿1-˜⊢)´˘ lc # part 1
•Show +´ ×´¨ (⊢/˜2=≠¨) nats ⊔˜ ⊐ (∾ ("*"⊸⍷P↕∘≢) pad)⊸(∊/⊣)¨ (↕3⋈2⊸+)⊸(<·⥊¨·⋈+⚇1)⟜(1‿1-˜⊢)´˘ lc # part 2
