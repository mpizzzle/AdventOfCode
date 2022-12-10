#! /usr/bin/env BQN

⟨ToNat, Part⟩ ← •Import "idioms.bqn"
input ← •FLines "files/4.txt"

•Show > +˝ (⊢ ⋈○(0≥×´∘-´) ⌽ ⌾ ⊑)∘((2/↕2)⊸⊔)∘(ToNat¨)∘(⊢Part˜⊢¬∘∊",-"˙)¨ input
