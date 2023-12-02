#! /usr/bin/env bqn

⟨ToNat, Split⟩ ← •Import "idioms.bqn"

input ← •FLines "files/2.txt"
init ← ∘‿2 ⥊ 'r'‿0‿'g'‿0‿'b'‿0

Parse ← (∘‿2 ⥊ 1 ↓ ' '⊸Split)∘(','⊸≠⊸/)¨ ';' Split ¯1 ⊑ ':'⊸Split
_f ← { (𝕗´⊑∘⌽˘)¨ ·(⊢⊔˜·⊐⊑˘) init ∾ (⌽ToNat⊸∾⟜⊑)´˘ }

•Show +´ 1 + / (∧´∘∾ ·(12‿13‿14 ≥ +_f)¨ Parse)¨ input # part 1
•Show +´ (×´·⌈_f·∾Parse)¨ input # part 2
