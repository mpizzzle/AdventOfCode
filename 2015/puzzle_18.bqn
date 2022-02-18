#! /usr/bin/env BQN

input ← '#'=> •FLines "files/18.txt"
m ← 4≠3‿3⥊↕9

G ← ⊢↑˘˜2+≠∘⍉
R ← ¯1⊸⌽
Neighbours ← +´⎉1 ⍟2 (m⊸∧⎉2 3‿3↕{ R⍉R G⍉G 𝕩 })
Life ← ⊢ (3⊸=∨⊣∧2⊸=) Neighbours

+´+˝ Life ⍟ 100 input # part 1
