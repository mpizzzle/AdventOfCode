#! /usr/bin/env BQN

⟨ToInt, Part, Trim⟩ ← •Import "idioms.bqn"
input ← •FLines "files/5.txt"

crates ← <∘⌽∘Trim∘⌽˘(1+4×↕9)⊏⍉> 8↑input
instructions ← ⌽(1-˜1+⌾⊑(ToInt¨⊢Part˜('0'+↕10)∊˜⊢))¨ 10↓input

⊑¨ crates { (1↑𝕨)‿0⊸((⌽⌽∘↑¨)∾¨↓¨) ⌾ ((1↓𝕨)⊸⊏) 𝕩 }´ instructions # part 1
⊑¨ crates { (1↑𝕨)‿0⊸((⌽↑¨)∾¨↓¨) ⌾ ((1↓𝕨)⊸⊏) 𝕩 }´ instructions # part 2
