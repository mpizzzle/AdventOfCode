#! /usr/bin/env BQN

input ← •FLines "files/4.txt"

Partition ← (¬",-"∊˜⊢)(¬-˜⊢×·+`»⊸>)⊸⊔⊢
Group ← (2/↕2)⊸⊔
Parse ← (10⊸×⊸+˜´∘⌽-⟜'0')¨
Range ← (⌊+(↕1+⌈-⌊))´¨
Intersect ← ⌈´¨((⍷∾⍷˜)⋈(∊∾∊˜))´

•Show > +˝ Intersect∘Range∘Group∘Parse∘Partition¨ input
