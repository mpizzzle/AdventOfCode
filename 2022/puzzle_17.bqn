#!/usr/bin/env BQN

⟨_while_, LCM⟩ ← •Import "idioms.bqn"

input ← (¯1⊸×+¬)'>'⊸= ⊑ •FLines "files/17.txt"
#input ← (¯1⊸×+¬)'>'⊸= ">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>"

a ← ≍"####"
b ← >".#."‿"###"‿".#."
c ← >"..#"‿"..#"‿"###"
d ← ⍉≍"####"
e ← >"##"‿"##"

forms ← (¯2⌽7⊸↑)˘¨ '#'⊸= a‿b‿c‿d‿e
state ← 0 ⋈ (¯4↑≍7/≍1) ⋈ 0 ⋈○≍ 0

Apply ← { 𝕨⊸{ 𝕩 ∨ 1 ⊑ 𝕨 } ⌾ (({ (1-˜ ⊑ ⌽ ⊑ 𝕩) + ↕ ⊑ ≢ 1 ⊑ 𝕩 } 𝕨)⊸⊏) 𝕩 }
Pad ← ⊢↑˜¯1×⊣+⊑∘≢∘⊢
Push ← (⊑⊣×¬∘(∨˝↑˘))⌽˘⊢

F ←  { 𝕩 Push˜ input ⊑˜ ⊑𝕨 }
W ←  { 𝕩 ⋈˜ 𝕨 |˜ ≠input }○(1⊸+)

Lol ← { (1⊑𝕨) + ↕⊑≢𝕩 }´
Overlap ← { ∨´∨˝ (1 ⊑ 𝕩) ∧ 𝕨 ⊏˜ Lol 𝕩 }´

Jet ← { (𝕨⋈𝕩) { 𝕩‿((1⊑1⊑𝕨) ⋈˜ ⊑𝕩) ⊑˜ Overlap (0⊑𝕨) ⋈ ((⊑1⊑𝕨) ⋈ 1⊑𝕩) }  { (𝕨 F 𝕩) ⋈˜ W´ 𝕨 }´ 𝕩 }

Do ← (⊣ ⋈ Jet)´

Cut ← { { (100⌊⊑≢𝕩) ↑ 𝕩} { 𝕩 ↑˜ ¯1×3+⊑≢𝕩 } 𝕩 ⊏˜ / ∨´˘ 𝕩}
Format ← ⊑∘≢⊸Pad⟜(Cut Apply˜´) ⋈ ⊣ ⋈˜ (⊑∘⊑1⊑⊢) ⋈ 0˙
Choose ← (≠∘⊢|⊣)⊑⊢
Loop ← { (𝕨 + 1) ⋈ Do _while_ (¬Overlap) 𝕩 Format˜ 𝕨 Choose forms }´

•Show 4 -˜ ⊑ ≢ Cut Apply˜´ 1 ⊑ Loop⍟2022 state # part 1
