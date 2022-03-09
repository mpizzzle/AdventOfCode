#!/usr/bin/env BQN

input ← •FLines "files/19.txt"

Split ← ⊢-˜+`×¬
Format ← 1‿0‿1 / ' ' (Split∘=⊔⊢) ⊢
Partition ← Split⊸⊔
ExpandShape ← { (≠𝕩) /⋈ 𝕨 }
ExpandIndices ← { 𝕩 ExpandShape˜ ↕≠𝕨 }
GetIndices ← { 𝕩 + 𝕨 ExpandIndices 𝕩 }
Indices ← { 𝕨 GetIndices 𝕨 /∘⍷ 𝕩 }
GetMasks ← { (𝕨 ExpandIndices 𝕩) ∊¨ 𝕩 }
RotateColumns ← ∾ ⌽ ⌾ (2⊸↑)
GetPartitions ← GetMasks Partition¨ ExpandShape
DoThing ← ⊣ Indices˜ 0 ⊑ ⊢
EnlistReplacement ← ⋈ 1⊸⊑
GetElectrons ← /∘((∨´∘∾)¨'e'⊸=)⊏⊢

GetMolecules ← {
  idx ← 𝕨 DoThing 𝕩
  replace ← idx ExpandShape˜ EnlistReplacement 𝕩
  partitions ← 𝕨 GetPartitions idx
  stripped ← ∾¨ partitions
  joined ← replace ∾¨ stripped
  RotateColumns ¨ joined
}

replacements ← ⌽∘Format ¨ ¯2↓input
byLength ← { 𝕩 ⊏˜ ⍒ ≠∘⊑¨𝕩 } replacements
molecule ← ¯1 ⊑ input

≠ ⊑ molecule GetMolecules 1 ⊑ byLength

testMolecule ← "HOHOHO"

testReplacements ← ⟨
  "e => H",
  "e => O",
  "H => HO",
  "H => OH",
  "O => HH"
⟩

sorted ← (⍒≠∘⊑¨)⊸⊏ ⌽∘Format ¨ testReplacements


/ testMolecule ⍷˜ ⊑ 0 ⊑ sorted

#firstGen ← ⊑∘⌽¨ GetElectrons replacements
#secondGen ← ⍷∾ replacements ⊸ { ∾ 𝕩 ⊸ GetMolecules ¨ 𝕨 } ¨ firstGen
#thirdGen ← ⍷∾ replacements ⊸ { ∾ 𝕩 ⊸ GetMolecules ¨ 𝕨 } ¨ secondGen
#
#tr ← Format ¨ testReplacements
#testFirstGen ← ⊑∘⌽¨ GetElectrons tr
#f ← ⊑ testFirstGen

#x ← ("HH" ExpandShape ⋈⋈0)
#w ← "H" GetMasks ⋈⋈0
#w (1≠≠∘∾) ◶ ⊢‿Partition x
#w Partition¨ x
#f GetMolecules 2 ⊑ tr
#⍷∾ tr  { ∾ 𝕩 ⊸ GetMolecules ¨ 𝕨 } ⊑ testFirstGen

•Show ≠⍷∾ molecule ⊸ GetMolecules ¨ replacements  # part 1
