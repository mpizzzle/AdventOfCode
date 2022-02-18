#! /usr/bin/env BQN

input ← '#'=> •FLines "files/18.txt"

G ← ⊢↑˘˜2+≠∘⍉
R ← ¯1⊸⌽
F ← ⊢∨⌽

Mask ← { 𝕩 ∨ F⍉F ×⌜˜ 1∾(1-˜≠𝕩) / ≍0 }
Neighbours ← +´⎉1 ⍟2 ((4≠3‿3⥊↕9)⊸∧⎉2 3‿3↕{ R⍉R G⍉G 𝕩 })
Life ← ⊢ (3⊸=∨⊣∧2⊸=) Neighbours

•Show +´+˝ Life ⍟ 100 input # part 1
•Show +´+˝ Mask∘Life ⍟ 100 Mask input # part 2
