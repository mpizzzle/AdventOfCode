#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"
input ← •FLines "files/4.txt"

Group ← (2/↕2)⊸⊔
Range ← (⌊+(↕1+⌈-⌊))´¨
Intersect ← ⌈´¨((⍷∾⍷˜)⋈(∊∾∊˜))´ # TODO: convert to boundary check instead of set intersection for better performance

•Show > +˝ Intersect∘Range∘Group∘(ToInt¨)∘((¬",-"∊˜⊢)Part⊢)¨ input
