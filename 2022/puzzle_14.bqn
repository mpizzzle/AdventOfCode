#!/usr/bin/env BQN

⟨Digits, Part, ToNat, Group, _while_⟩ ← •Import "idioms.bqn"

input ← (⋈⟨320,159⟩‿⟨700,159⟩) ∾ (2 Group (ToNat¨ Digits⊸Part))¨ •FLines "files/14.txt"

A ← (1+(+´|))⊸(↕∘⊣×(⊣/⋈∘(×∘-)∘⊢))

walls ← (⊢-≠/(⋈⌊´)) ⟨500‿0⟩ ∾ ⍷ ∾ (∾∘((⊢+≠∘⊢/⋈∘⊣)´¨)∘((⊏⋈¨(<∘A-´))˘) 2⊸↕)¨ input
waterfall ← { 𝕩⊸(¬ ¯1 ⌽ ∊˜)˘ (⍉∘↕3+⌈´) 𝕩 } walls
origin ← 1‿0 + ⊑walls

Next ← ⊑ (⋈ 0‿1⊸⊑) ∾˜ ⊣ ((/⊢⊑⍉∘⊣)⊏⊢) 1⊸⊏
Path ← (⋈ ⊣ Next { (1‿0 -˜ 𝕩)⊸+⌜ (⌽ ⌾ (2⊸↑1⊸⊏) ⍉ ↕3‿2) }∘⊑∘⊢) ∾ ⊢
Recurse ← { 𝕨⊸Path _while_ (⊑ ≢ ⊑∘(𝕨⊸Path)) 𝕩 }
Update ← 1⊸↓ ⋈˜ ⊣ { ¬ ⌾ (𝕩⊸⊑) 𝕨 } ⌽∘⊑∘⊢
Sand ← (⊣ Update Recurse)´

•Show ⊑ ((Sand 1⊸⊑) ⋈˜ 1+⊑) _while_ (1=(×´158⊏(⊑1⊑⊢))) ¯1 ⋈ waterfall ⋈⋈ origin # part 1
•Show ⊑ ((Sand 1⊸⊑) ⋈˜ 1+⊑) _while_ (¬(⌽origin)⊑(⊑1⊑⊢)) 0 ⋈ waterfall ⋈⋈ origin # part 2
