#! /usr/bin/env BQN

input ← "hepxcrrq"
no ← 8‿11‿14
s ← 3↕↕26

Ord ← (97-˜(|@⊸-))¨
Ignore ← ∨´no⊸∊
Straight ← s(¬∘∨´∘∨˝{ ⍷⟜𝕨˜˘𝕩 })˜⊢
Pairs ← 2>+´∘((∨´1=|∘(-´˘2⊸↕))¨⊢/˜1<≠¨)∘⊔

Carry ← { (𝕨 + 26 ≤ ⊑𝕩) ∾ (26|⊑) ⌾ ⊑ 𝕩 }
Inc ← { (1+¯1⊑𝕩) ⌾ (¯1⊸⊑) 𝕩 }

While ← (@+97+⊢) ¨ Carry´∘Inc {𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩} (Ignore ∨ Straight ∨ Pairs)

•Show password ← While Ord input # part 1
•Show While Carry´∘Inc Ord password #part 2
