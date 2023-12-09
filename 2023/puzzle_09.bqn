#! /usr/bin/env bqn

⟨Split, ToInt⟩ ← •Import "idioms.bqn"

input ← (ToInt¨' '⊸Split)¨ •FLines "files/9.txt"

S ← ¯1 ⊑ {(+`⊑∾·(1≡≠∘⍷) ◶ 𝕊‿(∾⟜⊑) 1↓+`⁼) 𝕩 }

•Show +´S¨ input # part 1
•Show +´S∘⌽¨ input # part 2
