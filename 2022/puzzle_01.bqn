#! /usr/bin/env BQN

ParseInt ← (10⊸×⊸+˜´∘⌽-⟜'0')'0'⊸∾
input ← ParseInt¨•FLines "files/1.txt"

•Show (⌈´⋈(+´3↑∨)) (+´¨0⊸<(¬-˜⊢×·+`»⊸>)⊸⊔⊢) input
