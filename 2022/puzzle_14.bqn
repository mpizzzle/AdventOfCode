#!/usr/bin/env BQN

⟨Digits, Part, ToNat, Group⟩ ← •Import "idioms.bqn"

_While_ ← {𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}

Parse ← (2 Group (ToNat¨ Digits⊸Part))¨

test ← Parse "498,4 -> 498,6 -> 496,6"‿"503,4 -> 502,4 -> 502,9 -> 494,9"
input ← Parse •FLines "files/14.txt"

A ← (1+(+´|))⊸(↕∘⊣×(⊣/⋈∘(×∘-)∘⊢))

walls ← ⟨500‿0⟩ ∾ ⍷ ∾ {∾{𝕨⊸+¨𝕩}´¨ (⊏ ⋈¨ <∘(A-´))˘ 2↕𝕩 }¨ input
shifted ← (⊢-≠/(⋈⌊´)) walls
coords ← (⍉∘↕3+⌈´) shifted
windows ← ((⌽ ⌾ (2⊸↑1⊸⊏))⎉2 2‿3⊸↕) coords
o ← (⊑⊑shifted) ⊏ 0 ⊏ windows
waterfall ← (¬ ¯1 ⌽ shifted ∊˜ ⊢)˘ coords

Next ← { ⊑ (⋈ 1 ⊑ 0 ⊏ 𝕨) ∾˜ (1 ⊏ 𝕨) ⊏˜ / (1 ⊏ 𝕨) ⊑ ⍉ 𝕩 }
NextWindow ← { (1-˜⊑ 𝕨) ⊏ (⊑∘⌽ 𝕨) ⊏ 𝕩 }
Step ← windows NextWindow˜ Next˜

Sand ← { 0 ⌾ ((⌽ 0‿1 ⊑ 𝕩⊸Step _While_ (𝕩⊸(⊢ ≢ Step)) o)⊸⊑) 𝕩 }

Sand⍟719 waterfall
