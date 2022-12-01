#! /usr/bin/env BQN

ParseInt ← (10⊸×⊸+˜´∘⌽-⟜'0')'0'⊸∾
input ← ParseInt¨•FLines "files/1.txt"

calorieCounts ← { 𝕩⊸(+´⊏˜)∘(⊑ + ⊑∘⌽ ↕∘- 1-˜⊑)¨ <˘ 2 ↕ 0 ∾ /0 = 𝕩 } input

•Show ⌈´ calorieCounts # part 1
•Show +´ 3 ↑ ∨ calorieCounts # part 2
