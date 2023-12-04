#! /usr/bin/env bqn

⟨Part, Split, ToNat⟩ ← •Import "idioms.bqn"

input ← •FLines "files/4.txt"

Parse ← (ToNat¨ ∊⟜('0'+↕10) Part ⊢)¨ '|' Split ¯1 ⊑ ':'⊸Split

wins ← +´∘∊´∘Parse¨ input

•Show +´ { 2⊸×⍟(𝕩-1) 𝕩 > 0 }¨ wins # part 1
•Show +´ { (1¨↕∘≠𝕩) { 𝕨 + »⍟(1+⊑𝕩) (𝕨 ⊑˜ ⊑𝕩) × (¯1⊑𝕩)>↕≠𝕨 }˜´⌽ <˘ ⍉ ↕∘≠⊸≍ 𝕩 } wins # part 2
