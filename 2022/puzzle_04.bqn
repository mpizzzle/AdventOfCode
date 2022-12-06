#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"
input ← •FLines "files/4.txt"

P1 ← 0≥×´∘-´
P2 ← 0⊸(¬<+○(⌊´)>)∘(⥊-⌜´)

•Show > +˝ (P1⋈P2)∘((2/↕2)⊸⊔)∘(ToInt¨)∘(⊢Part˜⊢¬∘∊",-"˙)¨ input
