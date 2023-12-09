#! /usr/bin/env bqn

⟨Split, ToInt⟩ ← •Import "idioms.bqn"

input ← (ToInt¨' '⊸Split)¨ •FLines "files/9.txt"

_s ← { 𝔽` (⊑𝕩) ∾ (1≡≠∘⍷) ◶ (𝔽_s)‿(∾⟜⊑) 1 ↓ 𝔽`⁼ 𝕩 }

•Show +´ (¯1⊸⊑+_s)¨ input # part 1
•Show +´ (¯1⊸⊑-_s∘⌽)¨ input # part 2
