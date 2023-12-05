#! /usr/bin/env bqn

⟨Part, Split, ToNat⟩ ← •Import "idioms.bqn"

input ← •FLines "files/5.txt"

seeds ← ToNat¨ 1 ↓ ' ' Split ⊑ input
maps ← ((ToNat¨' '⊸Split)¨ 1⊸↓) ¨ (⊢ Part˜ 0<≠¨) 2 ↓ input

Map ← { 𝕨 (-´2⊸↑)⊸+˜¨ ((¯1⊸⊑·/1⊸∾)˘ ⍉ 𝕩 (1⊸↓)⊸(+´⊸>∧⊑⊸≤)⌜ 𝕨) ⊏ (⋈0‿0‿0) ∾ 𝕩 }

⌊´seeds Map˜´⌽ maps # part 1
(<˘ ∘‿2 ⥊ seeds) (+´⊸>∧⊑⊸≤)⌜ (⋈20191102) Map˜´ ⌽⌾(2⊸↑)⚇1 maps # part 2
