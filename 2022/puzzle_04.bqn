#! /usr/bin/env BQN

input ← •FLines "files/4.txt"

Partition ← ('0'+↕10)⊸(∊˜)⊸((¬-˜⊢×·+`»⊸>)⊸⊔)
Group ← (2/↕2)⊸⊔
Parse ← (10⊸×⊸+˜´∘⌽-⟜'0')¨
Range ← (⌊+(↕1+⌈-⌊))´¨
Intersect ← (0<(⍷∾⍷˜) ∾○(+´) (∊∾∊˜))´

> +˝ Intersect∘Range∘Group∘Parse∘Partition¨ input
