#! /usr/bin/env bqn

⟨Part, Split, ToNat⟩ ← •Import "idioms.bqn"

input ← •FLines "files/6.txt"

_parse ← { (𝔽·' '⊸≠⊸Part ¯1 ⊑ ':'⊸Split)¨ }

Q ←  {
  a‿b‿c ← 𝕩
  (2×a)÷˜b-⊸(+⋈-)√(×˜b)-4×a×c
}

time‿dist ← ToNat¨_parse input
•Show ×´ +´¨ dist < (⊢×-)⟜↕¨ time # part 1

time‿dist ↩ ToNat∘∾_parse input
•Show 1 + ⌊⊸-⟜⌈˜´ Q ⟨¯1,time,¯1×dist⟩ # part 2
