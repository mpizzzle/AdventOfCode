#!/usr/bin/env BQN

⟨Digits, Part, Split, ToNat, LCM⟩ ← •Import "idioms.bqn"

input ← (⊢Part˜0<≠¨) •FLines "files/11.txt"

start‿div‿true‿false ← <˘ (ToNat¨ Digits⊸Part)¨ 1‿3‿4‿5 ⊏ ⍉> input
mod ← LCM´∾div

Parse ← ∾∘⌽ "⊢" ∾ ((("+×"⊑˜'*'⊸=) ⌾ ⊑)∘(((+´'o'⊸⍷) ⊑ "⊢"⋈˜⊢) ⌾ (1⊸⊑)) ¯2 ↑ ' '⊸Split)
Ops ← ⊣ ◶ (•BQN∘Parse¨ 2 ⊏˘ >input)
Update ← (1+⊑)⊸↓ ∾˜ ⊑⊸↑ ∾ (⋈(⊑⊑⊸↓) ∾ ⊑∘⌽∘⊣)

Test ← (∾⊣ ⊑¨ true‿false ⊏˜ 0 ≠ (⊑⊣⊑div˙)⊸|) (⌽⋈¨) ⊢
Total ← ⊑∘⌽∘⊢ + ≠∘⊑⟜⊑ × ⊣=↕∘≠∘⊑∘⌽∘⊢

_worry ← { ((↑∾(⟨⟩⌾⊑)∘↓) Update´ ⊣ Test mod | 𝕗∘(⊣ Ops¨ ⊑))⟜⊑ ⋈ Total }

•Show ×´ 2 ↑ ∨ 1 ⊑ start (⌽∘⊢ (⌊3÷˜⊢)_worry´˜⍟20 ⊣⋈0⊸×) ↕≠input # part 1
•Show ×´ 2 ↑ ∨ 1 ⊑ start (⌽∘⊢ ⊢_worry´˜⍟10000 ⊣⋈0⊸×) ↕≠input # part 2
