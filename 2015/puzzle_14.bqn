#!/usr/bin/env BQN

input ← •FLines "files/14.txt"

Split ← ' '((⊢-˜+`×¬)∘=⊔⊢)⊢
Strip ← •BQN ¨ ((0∾˜/⁼ 3‿6‿13) / ⊢)
Sequence ← (1⊸⊑⥊0⊸⊑)∾0⥊˜2⊸⊑
Sum ← +´2503⥊⊢

⌈´Sum∘Sequence∘Strip∘Split ¨ input # part 1
