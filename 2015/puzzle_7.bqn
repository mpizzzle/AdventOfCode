#!/usr/bin/env BQN

input ← •FLines "files/7.txt"

Partition ← (4<˜(↕∘4+(⊏∘/" -> "⊸⍷))⊒↕∘≠) (⊢-˜+`×¬)⊸⊔⊢
Format ← ∾¯1⊸↑∾'←'∾1⊸↑
Define ← {⟨"", "", 1⊑¨𝕩⟩ 𝕎 "←•args" ∾˜ 1↓ ∾'‿'∾¨ 0⊑¨𝕩 }

B ← 2 {⌽𝕗|⌊∘÷⟜𝕗⍟(↕1+·⌊𝕗⋆⁼1⌈⊢)} ⊢ # int to binary array
N ← 2⊸×⊸+˜´∘⌽⊢ # binary array to int
P ← (16-⊸↑⊢)∘B # pad to 16 bits

Execute ← {
  repl ← •ReBQN {repl ⇐ "loose"}
  repl Define ⟨ "and"‿(N∧○P), "or"‿(N∨○P), "lshift"‿(N⥊⟜0⊸«⟜P˜), "rshift"‿(N⥊⟜0⊸»⟜P˜), "not"‿¬ ⟩
  REPL⎊⊢¨ ⍟ 111 Format∘Partition ¨ 𝕩
  REPL "a"
}

•Show a ← Execute input # part 1
•Show Execute (" -> b" ∾˜ •Fmt a) ⌾ (3⊸⊑) input # part 2
