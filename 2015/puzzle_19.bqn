#!/usr/bin/env BQN

input ← •FLines "files/19.txt"

Format ← 1‿0‿1 / ' '((⊢-˜+`×¬)∘=⊔⊢)⊢

replacements ← Format ¨ ¯2↓input
molecule ← ¯1 ⊑ input

ExpandShape ← { (≠𝕩) /⋈ 𝕨 }
ExpandIndices ← { (≠𝕩) /⋈↕ (≠𝕨) }
GetIndices ← { 𝕩 + 𝕨 ExpandIndices 𝕩 }
Indices ← { 𝕨 GetIndices 𝕨 /∘⍷ 𝕩 }
StripEmpty ← ⊢/˜0<≠¨
Partition ← (⊢-˜+`×¬)⊸⊔
GetMasks ← { (𝕨 ExpandIndices 𝕩) ∊¨ 𝕩 }
RotateColumns ← ∾ ⌽ ⌾ (2⊸↑)
GetPartitions ← GetMasks Partition¨ ExpandShape
GetReplacements ← ⊣ ExpandShape ˜ ⋈
DoThing ← ⊣ Indices˜ 0 ⊑ ⊢

GetMolecules ← {
  RotateColumns ¨ ((𝕨 DoThing 𝕩) GetReplacements (1 ⊑ 𝕩)) ∾¨ StripEmpty 𝕨 GetPartitions (𝕨 DoThing 𝕩)
}

≠⍷∾ molecule⊸GetMolecules¨ replacements # part 1
