#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"

input ← •FLines "files/7.txt"
nols ← input ⊏˜/(¬∘(⌈´"$ ls"⊸⍷)) ¨ input
cd ← (⌈´"$ cd"⊸⍷) ¨ nols

GetSizes ← ToInt⊢⊏˜(/('0'+↕10)∊˜⊢)

S ← 1-˜≠
Traverse ← { ((¯1×S𝕩) ↓ 𝕨) ∾ (S𝕩) ↓ 𝕩  }`

keys ← Traverse nols Part˜ cd
totals ← (+´GetSizes¨)¨ nols Part˜ ¬cd
results ← {+´totals ⊏˜ 𝕩}¨ { /(𝕩 ⊑ keys)⊸(1×+´∘⍷)¨ keys }¨ ↕≠keys

•Show +´ results ⊏˜ /results ≤ 100000 # part 1
•Show ⌊´ results ⊏˜ /results ≥ 40000000 -˜ ⊑ results # part 2
