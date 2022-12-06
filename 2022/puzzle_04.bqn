#! /usr/bin/env BQN

⟨ToInt, Part⟩ ← •Import "idioms.bqn"
input ← •FLines "files/4.txt"

•Show > +˝ (⊢ ⋈○(0≥×´∘-´) ⌽ ⌾ ⊑)∘((2/↕2)⊸⊔)∘(ToInt¨)∘(⊢Part˜⊢¬∘∊",-"˙)¨ input
