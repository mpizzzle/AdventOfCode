#!/usr/bin/env BQN

input ← ⊑ •FLines "files/12.txt"

Count ← +´ •BQN¨∘((('-'∾'0'+↕10)∊˜⊢)⊸((¬-˜⊢×·+`»⊸>)⊸⊔))
ObjStack ← (⊣ (/ "[{" ⍷˜ ⊣)⊸∾ (∨´ "]}" ⍷˜ ⊣)⊸↓)˜
IdxStack ← (⊣ (⊢∾˜ ⊣ ↓˜ 1 + ¬∘(∨´ "[{" ⍷˜ ⊑)∘⊣) (∨´ "]}" ⍷˜ ⊑)⊸↓)˜
Idx ← (⊑¨ 0 IdxStack` ⊢ ∾¨ ↕∘≠)∘⊢
Ignore ← 1 ↓ (/ "red"⊸⍷) (⍷ (⊣ ⊏ (⊑¨ 0 ObjStack` ⊢)) ∧ ⊣ ⊏ Idx) ⊢
Range ← ¬ (⊣≥⌊´∘⊢) ∧ ⊣≤⌈´∘⊢

i ← Idx input

•Show Count input # part 1
•Show Count ((∧´ ⊢ { (↕≠𝕨)⊸(⊣ Range (/ i⊸=))¨ 𝕩 } Ignore)˜ / ⊢) input # part 2
