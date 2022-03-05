#!/usr/bin/env BQN

input ← •FLines "files/9.txt"

Format ← 0‿2‿4 ⊏ ' '⊸((⊢-˜+`×¬)∘=⊔⊢)
Permutations ← (≍↕0){∾˝(0∾˘1+𝕩)⊸⊏∘⍒˘=⌜˜↕𝕨}´-⟜↕

routes ← > •BQN ⌾ (¯1⊸⊑) ∘ Format ¨ input
all ← routes ∾ ⌽ ⌾ (2⊸↑) ˘routes
unique ← ⍷⊏⍉ all
indexed ← ((⊑∘/unique∊⋈)¨ ⌾ (0‿1⊸⊏))˘ all
distances ← indexed⊸(+´ ¯1 ⊏˘ (/ (2⊸↑)˘∘⊣ ∊ 2⊸↕) ⊏ ⊣)˘ Permutations ≠ unique

•Show ⌊´ distances # part 1
•Show ⌈´ distances # part 2
