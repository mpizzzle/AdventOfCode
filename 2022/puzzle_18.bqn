#!/usr/bin/env BQN

⟨Digits, Part, ToNat⟩ ← •Import "idioms.bqn"

test ← ⟨2‿2‿2, 1‿2‿2, 3‿2‿2, 2‿1‿2, 2‿3‿2, 2‿2‿1, 2‿2‿3, 2‿2‿4, 2‿2‿6, 1‿2‿5, 3‿2‿5, 2‿1‿5, 2‿3‿5⟩

input ← (ToNat¨ Digits Part ⊢)¨ •FLines "files/18.txt"

Sum ← {(⊑𝕩)⋈(1⊑𝕩)+1=+´|𝕨-⊑𝕩}

•Show {(6×≠𝕩) + +´¯2×𝕩} 1 ⊏˘ >(Sum´ ((0⋈˜⊢)⌾(⊑⌽)))¨ {𝕨∾⋈𝕩}` (⋈⌾⊑) input
