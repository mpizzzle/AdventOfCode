#! /usr/bin/env bqn

⟨Split, ToNat⟩ ← •Import "idioms.bqn"

i ← ToNat⌾(¯1⊸⊑)¨ ' '⊸Split¨ •FLines "files/7.txt"

Sub ← 'J'⊸=⊸{ (𝕨 ({⊑⍒/⁼⊐𝕩}⊸⊑ 'J' ∾˜ /∘¬⊸⊏) 𝕩)¨⌾((/𝕨)⊸⊏) 𝕩 }
_f ← { (+´⊢×1+↕∘≠) ¯1 ⊑¨ ·∾ (⊢⊏˜·⍒⊐⚇1⟜(⊑¨))⚇3⟜(+´∘⊒∘⊑∘𝔽¨⊸⊔) }

•Show "AKQJT98765432" ⊢ _f i # part 1
•Show "AKQT98765432J" (Sub∘⊑⋈¯1⊸⊑) _f i # part 2
