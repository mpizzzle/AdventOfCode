#! /usr/bin/env BQN

Split ← ' '⊸((⊢-˜+`×¬)∘=⊔⊢)
input ← Split ¨ •FLines "files/2.txt"

Win ← ⊣=1+3|⊢
Score ← { (6⊸×÷+´) (⊢=⌈´) (Win∾Win˜)´ 𝕩 }
GetTotals ← (⊢+Score)∘{ ∾<∘(1+/∘⍷˜)´˘⍉> ⟨"ABC","XYZ"⟩‿𝕩 }
ChooseCounter ← ⊣ { (𝕨 /∘⍷ "ABC") ⊏ 𝕏 "XYZ" } (¯1⊸⌽)‿⊢‿(1⊸⌽) ⊑˜ (/"XYZ"⍷˜⊢)

>+˝GetTotals¨ input # part 1
>+˝GetTotals∘(ChooseCounter´ ≍∘⊣ ⌾ (¯1⊸⊑) ⊢)¨ input # part 2
