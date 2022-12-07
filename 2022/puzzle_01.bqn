#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"
input ← ToInt¨ •FLines "files/1.txt"

•Show (⌈´⋈(+´3↑∨)) +´¨ (0⊸<Part⊢) input
