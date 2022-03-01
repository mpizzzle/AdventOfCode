#! /usr/bin/env BQN

input ← ⌽ •FLines "files/6.txt"
ops ← "turn on"‿"turn off"‿"toggle"
grid ← 0⌜˜↕1e3

Format ← ⊢ { '‿'¨ ⌾ (𝕩⊸/) 𝕨 } ','⊸=
Split ← ' ' (+`∘=⊔⊢) ⊢
Coords ← •BQN ¨ ¯3‿¯1⊸⊏
Ins ← {(/𝕩⊸(∨´⍷˜)¨ ops) ◶ 𝕨}
V‿H ← {(⊑𝕩)⊸↓∘⍉ (⊑⌽𝕩)⊸↓}‿{(⊑𝕩)⊸↑∘⍉ (⊑⌽𝕩)⊸↑}
Apply ← { (⊑⌽𝕨) ⌾ ((V ⌽⊑𝕨) ∘ (H 1+1⊑𝕨)) 𝕩 }
Total ← +´(+´˘ grid Apply´ ∾¨)

c ← Coords ∘ Split ∘ Format ¨ input

•Show c Total ⟨ 1¨, 0¨, ¬ ⟩⊸Ins¨ input # part 1
•Show c Total ⟨ 1⊸+, 0⌈1-˜⊢, 2⊸+ ⟩⊸Ins¨ input # part 2
