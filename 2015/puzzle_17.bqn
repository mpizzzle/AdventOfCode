#!/usr/bin/env BQN

input ← •BQN ¨ •Flines "files/17.txt"

target ← 150
duplicates ← /∘⊒⊸⊏ input
maxContainers ← +´ target >+` ∧ input

GetDimension ← { 𝕩 ((⍷∧¨)(>¬∘∊⌜)/○⥊∾⌜) ⍟ 𝕨 (<⌜˜/○⥊∾⌜˜) 𝕩 }

a ← +´ input⊸{ +´ target = +´¨ 𝕩 GetDimension 𝕨 }¨ ↕ maxContainers - 1
b ← +´ input⊸{ +´ target = +´¨ (⊑duplicates)⊸∾¨ 𝕩 GetDimension 𝕨 }¨ ↕ maxContainers - 2
c ← +´ input⊸{ +´ target = +´¨ (⊑⌽duplicates)⊸∾¨ 𝕩 GetDimension 𝕨 }¨ ↕ maxContainers - 2
d ← +´ input⊸{ +´ target = +´¨ duplicates⊸∾¨ 𝕩 GetDimension 𝕨 }¨ ↕ maxContainers - 3

•Show +´ a‿b‿c‿d # part 1

e ← +´ target = +´¨ 2 GetDimension input
f ← +´ target = +´¨ (⊑duplicates)⊸∾¨ 1 GetDimension input
g ← +´ target = +´¨ (⊑⌽duplicates)⊸∾¨ 1 GetDimension input
h ← +´ target = +´¨ duplicates⊸∾¨ 0 GetDimension input

•Show +´ e‿f‿g‿h # part 2
