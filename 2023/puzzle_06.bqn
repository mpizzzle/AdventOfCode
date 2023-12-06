#! /usr/bin/env bqn

⟨Part, Split, ToNat⟩ ← •Import "idioms.bqn"

input ← •FLines "files/6.txt"
test ← ⟨ "Time:      7  15   30",
         "Distance:  9  40  200" ⟩

time‿dist ← (ToNat¨ ·' '⊸≠⊸Part ¯1 ⊑ ':'⊸Split)¨ test
×´ +´¨ dist < (⊢×-)⟜↕¨ time # part 1

#some value q
#such that q × (t - q) > d
#solve for q?
#(q × t) - (q⋆2) - d > 0

Q ←  {
  a‿b‿c ← 𝕩
  (2×a)÷˜b-⊸(+⋈-)√(×˜b)-4×a×c
}

time‿dist ↩ (ToNat∘∾·' '⊸≠⊸Part ¯1 ⊑ ':'⊸Split)¨ input

qq ← Q <˘⍉>  ¯1‿time‿(¯1×dist)
1 + {(⌈𝕨) -˜ (⌊𝕩)}´  qq # part 2

