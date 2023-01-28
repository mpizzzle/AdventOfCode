#! /usr/bin/env BQN

input ← > '0' -˜ •FLines "files/8.txt"

Trees ← (0=⊒˘) ⌈`˘

l ← Trees input
r ← ⌽˘ Trees ⌽˘ input
u ← ⍉ Trees ⍉ input
d ← ⍉ ⌽˘ Trees ⌽˘ ⍉ input

Scenic ← {
  row‿col ← 𝕨 (⊑⊸⊏ ⋈ (1⊸⊑)⊸(⊏˘)) 𝕩

  n ← ⌽ (0 ⊑ 𝕨 + 1) ↑ col
  e ← (1 ⊑ 𝕨) ↓ row
  s ← (0 ⊑ 𝕨) ↓ col
  w ← ⌽ (1 ⊑ 𝕨 + 1) ↑ row

  ×´∾ (⥊0⊸∊+·+´×`)∘(1 ↓ ⊑⊸>)¨ n‿e‿s‿w
}

•Show +´+˝∨´ l‿r‿u‿d # part 1
•Show ⌈´⌈˝ (input Scenic˜ ⋈)⌜˜ ↕≠input # part 2
