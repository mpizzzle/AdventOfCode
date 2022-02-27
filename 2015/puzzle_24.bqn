#!/usr/bin/env BQN

input ← •BQN ¨ •FLines "files/24.txt"

UniquePairs ← <⌜˜/○⥊∾⌜˜
DimensionUp ← (⍷∧¨)(>¬∘∊⌜)/○⥊∾⌜
GetDimension ← { 𝕩 DimensionUp ⍟ 𝕨 UniquePairs 𝕩 }
FilterByWeight ← ⊢/˜⊣=(+´¨⊢)
QuantumSort ← (⍋×´¨)⊸⊏
GetWeighting ← ⊣÷˜+´∘⊢

•Show ×´⊑ QuantumSort (3 GetWeighting input) FilterByWeight 4 GetDimension input # part 1
•Show ×´⊑ QuantumSort (4 GetWeighting input) FilterByWeight 2 GetDimension input # part 2
