#!/usr/bin/env BQN

⟨Split, ToInt, Group, _while_⟩ ← •Import "idioms.bqn"

Parse ← { 2 Group ToInt¨ (¯1⊸↑∾˜¯1↓¨3⊸↑) 2 ↓¨ 2‿3‿8‿9 ⊏ ' '⊸Split 𝕩 }¨

input ← Parse •FLines "files/15.txt"

C ← {(𝕨≤1) ∧ (𝕩≥¯1)}

Take ← { ((⊑𝕨)⌊⊑𝕩)⋈((⊑⌽𝕨)⌈⊑⌽𝕩) }

G ← { (𝕩⋈𝕨Take𝕩) ⊑˜ C´ 𝕨-⌽𝕩 }
F ← { G´ 𝕩 ⌽⌽ 𝕨 }
S ← {⍷ 𝕩⊸F¨ ↕≠𝕩}

R ← { ((⊢+𝕨-⊢) ⌾ (1⊸⊑))¨ ⊑¨ 𝕩 }
Q ← { (⊑¨ 𝕨 ⊏˜ / 𝕩 ≥ 0) (-⋈+)¨ (𝕩 ⊏˜ / 𝕩 ≥ 0) }
K ← { ((+´|∘-)´¨ 𝕩) - | (𝕨-1⊸⊑)¨ ⊑¨ 𝕩 }

Row ← (+´(1+-˜)´¨)∘(S⍟2 R Q K) - (+´⊣=1⊑¨(⍷1⊸⊑¨))
Scan ← (((1⊸+)⊸⋈⋈((S⍟2 ((0⌈⊣)∾4000000⌊⊢)´¨) R Q K))´⊢)´

•Show 2000000 Row input # part 1
•Show ((1-˜(⊑1⊸⊑)) + 4000000 × 1 + (1⊸⊑⊑∘⊑)) Scan _while_ (1=≠∘⊑) ⟨⟨⟩⟩ ⋈ (0 ⋈ input) # part 2
