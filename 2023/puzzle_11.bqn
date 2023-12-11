#! /usr/bin/env bqn

⟨Split, ToInt⟩ ← •Import "idioms.bqn"

input ← > '#' = •FLines "files/11.txt"

R ← 1+×⟜(¬∨´˘)
S ← 2 ÷˜ ·+´·+˝·(+´|∘-)⌜˜∘(⊢/○⥊↕∘≢) R⟜⍉/·⍉R/⊢

•Show f ← 1 S input # part 1
•Show f + (1000000 - 2) × f -˜ 2 S input # part 2
