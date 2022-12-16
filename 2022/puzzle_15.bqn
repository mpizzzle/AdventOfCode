#!/usr/bin/env BQN

⟨Split, ToInt, Group, Part⟩ ← •Import "idioms.bqn"

input ← { 2 Group ToInt¨ (¯1⊸↑∾˜¯1↓¨3⊸↑) 2 ↓¨ 2‿3‿8‿9 ⊏ ' '⊸Split 𝕩 }¨ •FLines "files/test.txt"
input2 ← { 2 Group ToInt¨ (¯1⊸↑∾˜¯1↓¨3⊸↑) 2 ↓¨ 2‿3‿8‿9 ⊏ ' '⊸Split 𝕩 }¨ •FLines "files/15.txt"

manhattans ← (+´|∘-)´¨ input2
level ← 2000000

ps ← ((⊢+level-⊢) ⌾ (1⊸⊑))¨ ⊑¨ input2
d ← manhattans - | (level-1⊸⊑)¨ ⊑¨ input2
dt ← d ⊏˜ / d ≥ 0
st ← ⊑¨ ps ⊏˜ / d ≥ 0

ranges ← st (-⋈+)¨ dt

C ← {(𝕨≤0) ∧ (𝕩≥0)}
G ← { 𝕨‿(((⊑𝕨)⌊⊑𝕩)⋈((⊑⌽𝕨)⌈⊑⌽𝕩)) ⊑˜ C´ 𝕨-⌽𝕩 }
F ← { G´ 𝕩 ⌽ 𝕨 }

next ← (⌽ranges)⊸F¨ ↕≠ranges
n1 ← ⍷ (⌽next)⊸F¨ ↕≠next

bc ← +´ level = 1 ⊑¨ ⍷ 1 ⊑¨ input2

•Show bc -˜ +´(1+-˜)´¨ n1 # part 1
