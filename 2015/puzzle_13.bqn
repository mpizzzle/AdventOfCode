#!/usr/bin/env BQN

input ← (' '((⊢-˜+`×¬)∘=⊔⊢)'.'⊸≠⊸/)¨ •FLines "files/13.txt"

Strip ← (0‿2‿3‿10 ∊˜ ↕11)⊸/
Replace ← ("-+" ⊑˜ (⌈´ "gain"⊸∊)) ⌾ (1⊸⊑)
Truncate ← { (⊑𝕩)‿(•BQN (∾´1‿2⊸⊏) 𝕩)‿(⊑⌽𝕩) }
Permutations ← (≍↕0){∾˝(0∾˘1+𝕩)⊸⊏∘⍒˘=⌜˜↕𝕨}´-⟜↕
Neighbours ← (⍉∘> ¯1⊸⌽ ∾○< 1⊸⌽)∘⊏˜
Arrangement ← 1⊸⊑¨ ⊢ /˜ ⊣ ∊˜ ⊑∘⌽¨∘⊢
Filter ← <˘˘ ⊢ ⊏ ((⊢⊏˜(/0=7|↕∘≠)) 7↕⊣)
RemoveWorst ← +´∘(⊢/˜⊢≠⌊´) +´˘∘⍉∘(1⊸⌽ ⌾ ⊏)∘⍉

potentials ← >Truncate∘Replace∘Strip¨ input
people ← ⍷ ⊑¨ input
perms ← Permutations ≠ people

•Show ⌈´ (people⊸Neighbours (+´+´∘Arrangement˘) potentials⊸Filter)˘ perms # part 1
#•Show ⌈´ (RemoveWorst people⊸Neighbours Arrangement˘ potentials⊸Filter)˘ perms # part 2
