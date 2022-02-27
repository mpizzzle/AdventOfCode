#!/usr/bin/env BQN

input ← •BQN ¨ •FLines "files/24.txt"

GetDimension ← { 𝕩 ((⍷∧¨)(>¬∘∊⌜)/○⥊∾⌜) ⍟ 𝕨 (<⌜˜/○⥊∾⌜˜) 𝕩 }
FilterByWeight ← ⊢/˜⊣=+´¨∘⊢
GetWeighting ← ⊣÷˜+´∘⊢
GetCandidate ← ×´∘⊑ ⊑∘⊣⊸GetWeighting FilterByWeight ⊑∘⌽∘⊣⊸GetDimension

•Show 3‿4 GetCandidate input # part 1
•Show 4‿2 GetCandidate input # part 2
