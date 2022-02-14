#!/usr/bin/env BQN

input ← •FLines "files/14.txt"

Split ← ' '((⊢-˜+`×¬)∘=⊔⊢)⊢
Format ← •BQN ¨ ((0∾˜/⁼3‿6‿13)/⊢)
Sequence ← 2503⥊(1⊸⊑⥊0⊸⊑)∾0⥊˜2⊸⊑

pattern ← Sequence∘Format∘Split ¨ input

•Show ⌈´+´¨ pattern # part 1
•Show ⌈´+˝(⌈´=⊢)˘⍉>+`¨ pattern # part 2
