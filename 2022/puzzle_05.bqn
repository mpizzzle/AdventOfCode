#! /usr/bin/env BQN

⟨ToNat, Part, Trim, Digits⟩ ← •Import "idioms.bqn"
input ← •FLines "files/5.txt"

crates ← <∘⌽∘Trim∘⌽˘(1+4×↕9)⊏⍉> 8↑input
instructions ← ⌽(1-˜1+⌾⊑(ToNat¨⊢Part˜Digits))¨ 10↓input

⊑¨ crates { (1↑𝕨)‿0⊸((⌽⌽∘↑¨)∾¨↓¨) ⌾ ((1↓𝕨)⊸⊏) 𝕩 }´ instructions # part 1
⊑¨ crates { (1↑𝕨)‿0⊸((⌽↑¨)∾¨↓¨) ⌾ ((1↓𝕨)⊸⊏) 𝕩 }´ instructions # part 2
