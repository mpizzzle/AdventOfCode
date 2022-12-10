#! /usr/bin/env BQN

⟨ToNat, Part⟩ ← •Import "idioms.bqn"
input ← ToNat¨ •FLines "files/1.txt"

•Show (⌈´⋈(+´3↑∨)) +´¨ (0⊸<Part⊢) input
