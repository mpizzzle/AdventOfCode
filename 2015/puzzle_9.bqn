#!/usr/bin/env BQN

input ← •FLines "files/9.txt"

Format ← 0‿2‿4 ⊏ ' '⊸((⊢-˜+`×¬)∘=⊔⊢)
Permutations ← (≍↕0){∾˝(0∾˘1+𝕩)⊸⊏∘⍒˘=⌜˜↕𝕨}´-⟜↕

routes ← (⊢ ∾ ⌽ ⌾ (2⊸↑)˘) > •BQN ⌾ (¯1⊸⊑) ∘ Format ¨ input
unique ← ⍷⊏⍉ routes
indexed ← ((⊑∘/unique∊⋈)¨ ⌾ (0‿1⊸⊏))˘ routes
distances ← indexed⊸(⊣ (+´¯1⊏˘⊏˜) (/(2⊸↑)˘∘⊣∊2⊸↕))˘ Permutations ≠ unique

•Show ⌊´ distances # part 1
•Show ⌈´ distances # part 2
