#!/usr/bin/env BQN

input ← •FLines "files/7.txt"

functions ← ⟨
  "B ← 2 {⌽𝕗|⌊∘÷⟜𝕗⍟(↕1+·⌊𝕗⋆⁼1⌈⊢)} ⊢", # int to binary array
  "N ← 2⊸×⊸+˜´∘⌽⊢", # binary array to int
  "P ← 16-⊸↑⊢", # pad to 16 bits
  "AND ← N∧○(P∘B)",
  "OR ← N∨○(P∘B)",
  "NOT ← N¬∘P∘B",
  "LSHIFT ← N⥊⟜0⊸«⟜(P∘B)˜",
  "RSHIFT ← N⥊⟜0⊸»⟜(P∘B)˜"
⟩

Partition ← (4<˜(↕∘4+(⊏∘/" -> "⍷⊢))⊒↕∘≠) (⊢-˜+`×¬)⊸⊔⊢
Format ← ∾¯1⊸↑∾'←'∾1⊸↑
Execute ← {
  repl ← •ReBQN {repl ⇐ "loose"}
  REPL ¨ functions
  ((REPL⎊⊢)¨⊢) ⍟ 111 Format∘Partition ¨ 𝕩
  •Show REPL "a"
}

a ← Execute input # part 1
Execute (" -> b" ∾˜ •Fmt a) ⌾ (3⊸⊑) input # part 2
