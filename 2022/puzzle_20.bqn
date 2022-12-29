#!/usr/bin/env BQN

⟨Part, ToInt⟩ ← •Import "idioms.bqn"

input ← ToInt¨ •FLines "files/20.txt"

_ins ← {(0=𝕗)⌽𝕗⊸↑∾⊣∾𝕗⊸↓}
Idx ← (1-˜≠∘⊢) | /∘⍷ + 1⊑⊑∘⊣
Move ← { 𝕨 (𝕨 Idx 𝕩)_ins 𝕨 (∾ ¬∘⍷ Part ⊢) 𝕩 }
Next ← ⊣ Move˜ ⊑¨⊸(/=) ⊏ ⊣
Mix ← ⊢ Next˜´ ⌽∘↕∘≠
Get ← ⊢ ⊑˜ ≠∘⊢ | |˜⟜≠ + (/0⊸=)
Grove ← (1000⊸Get + 2000⊸Get + 3000⊸Get) 1⊸⊑¨

•Show Grove Mix <˘⍉> ↕∘≠⊸⋈ input # part 1
•Show Grove (¯1 ⌽ Mix)⍟10 <˘⍉> ↕∘≠⊸⋈ input × 811589153 # part 2
