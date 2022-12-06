#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"
input ← •FLines "files/4.txt"

Group ← (2/↕2)⊸⊔
Range ← (⌊+(↕1+⌈-⌊))´¨
Intersect ← ⌈´¨((⍷∾⍷˜)⋈(∊∾∊˜))´

•Show > +˝ Intersect∘Range∘Group∘(ToInt¨)∘((¬",-"∊˜⊢)Part⊢)¨ input
