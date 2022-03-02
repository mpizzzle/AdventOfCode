#!/usr/bin/env BQN

input ← (' '((⊢-˜+`×¬)∘=⊔⊢)'.'⊸≠⊸/)¨ •FLines "files/13.txt"

Strip ← (0‿2‿3‿10 ∊˜ ↕11)⊸/
Replace ← ("-+" ⊑˜ (⌈´ "gain"⊸∊)) ⌾ (1⊸⊑)
Truncate ← 1 ⌽ ¯1‿0⊸⊏ ∾ •BQN∘(∾´1‿2⊸⊏)
Permutations ← (≍↕0){∾˝(0∾˘1+𝕩)⊸⊏∘⍒˘=⌜˜↕𝕨}´-⟜↕
Neighbours ← (⍉∘> ¯1⊸⌽ ∾○< 1⊸⌽)∘⊏˜
Arrangement ← 1⊸⊑¨ ⊢ /˜ ⊣ ∊˜ ⊑∘⌽¨∘⊢
Filter ← <⎉1 ⊢ ⊏ ((⊢⊏˜(/0=8|↕∘≠)) 8↕⊣)
RemoveWorst ← +´∘(⊢/˜⊢≠⌊´) +´˘∘⍉∘(1⊸⌽ ⌾ ⊏)∘⍉
Identity ← ⍉⊢∾↕∘≠∾≍
Align ← ⌽¨⊣⊏∧∘(⌽¨)∘⊢
Flip ← ⌽˘ ⌾ (0‿¯1⊸⊏)

people ← ⍷ ⊑¨ input
potentials ← ∧ (Identity people) ∾˜ >Truncate∘Replace∘Strip¨ input
perms ← Permutations ≠ people

•Show ⌈´ (people⊸Neighbours (+´+´∘Arrangement˘) potentials⊸Filter)˘ perms # part 1
•Show ⌈´ (RemoveWorst∘Flip people⊸Neighbours Arrangement˘ (≠/≍) Align˘ potentials⊸Filter)˘ perms # part 2
