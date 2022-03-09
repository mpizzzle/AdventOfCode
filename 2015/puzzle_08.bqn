#!/usr/bin/env BQN

input ← •FLines "files/8.txt"

ParseEscapes ← ¬∘⊣ ∧ '\'⊸≡
SumEscapes ← 2 + (+´+≠)∘(2 × 'x' = (/ ¯1 ⌽ 0 ParseEscapes` ⊢)⊸⊏)
AddEscapes ← 2 + (+´'"'‿'\'∊˜⊢)

•Show +´ SumEscapes ¨ input # part 1
•Show +´ AddEscapes ¨ input # part 2
