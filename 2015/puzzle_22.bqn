#!/usr/bin/env BQN

state‿costs ← ⟨ 50‿55‿500‿0‿0‿0‿¯1, 0‿53‿73‿113‿173‿229 ⟩
spells ← ⟨ ⟨0, 0⟩, ⟨¯4‿¯53, 1‿2⟩, ⟨2‿¯2‿¯73, 0‿1‿2⟩, ⟨¯113‿6, 2‿3⟩, ⟨¯173‿6, 2‿4⟩, ⟨¯229‿5, 2‿5⟩ ⟩

Turn ← 1⊸+ ⌾ (¯1⊸⊑)
Durations ← (0 ⌈ 1 -˜ ⊢) ⌾ (3‿4‿5⊸⊏)
Update ← { (⊑∘𝕨 +˜ ⊢) ⌾ (⊑∘⌽∘𝕨⊸⊏) 𝕩 }
Damage ← ¬∘⊣ × ¯8 - ¯7 × 0 < 3⊸⊑
Cast ← (spells ⊑˜ ⊣)⊸Update
Health ← (0 ⋈˜ 2 | 6⊸⊑⊸Damage)⊸Update
Poison ← (1 ⋈˜ ¯3 × 0 < 4⊸⊑)⊸Update
Mana ← (2 ⋈˜ 101 × 0 < 5⊸⊑)⊸Update
Hard ← (- 0 ⋈˜ 2 | 6⊸⊑)⊸Update

Play ← ⊣ Cast Durations∘Mana∘Poison∘Turn∘Health∘⊢

order ← 4‿0‿5‿0‿3‿0‿4‿0‿1‿0‿1‿0‿1‿0‿1‿0‿1

state Play´ ⌽ order # proof
•Show +´ order ⊏ costs # part 1

order ↩ 4‿0‿5‿0‿3‿0‿4‿0‿5‿0‿2‿0‿4‿0‿2‿0‿1

state Play⟜Hard´ ⌽ order # proof
•Show +´ order ⊏ costs # part 2
