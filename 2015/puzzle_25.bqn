#! /usr/bin/env BQN

y‿x ← 2978‿3083

F ← 1-˜⊢
G ← { (⊑+≠∾⊢) ⍟ 𝕩 𝕨 }
Idx ← ⊑(1 G F∘⊣)+⊣ (0⊸≠×(+´1+↕∘⊢+⊣)) F

•Show (33554393 | 252533⊸×) ⍟ (F y Idx x) 20151125
