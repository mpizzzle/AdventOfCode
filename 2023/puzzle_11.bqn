#! /usr/bin/env bqn

⟨Split, ToInt⟩ ← •Import "idioms.bqn"

input ← > '#' = •FLines "files/11.txt"

S ← {
  a ← 1 + 𝕨 × ¬ ∨´˘ 𝕩
  b ← 1 + 𝕨 × ¬ ∨´˘⌾⍉ 𝕩
  e ← b /⌾⍉ > a / 𝕩
  g ← (⊢ /○⥊ ↕∘≢) e
  2 ÷˜+´+˝(+´|∘-)⌜˜ g
}

•Show f ← 1 S input # part 1
•Show f + (1000000 - 2) × (f -˜ 2 S input) # part 2
