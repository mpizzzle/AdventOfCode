#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/10.txt'

p← {(2|⍳2×⍴⍵ )⊂ 2/⍵ }¨input ⍝ partition chars
s← +⌿+/(3×p=')') (¯3×p='(') (57×p=']') (¯57×p='[') (1197×p='}') (¯1197×p='{') (25137×p='>') (¯25137×p='<') ⍝ map scores
f← {(2⌷⍴ b)⍴ b← ⍉ ⊃ ⍵ } ¨ ⊃ s ⍝ formatting

r← {⍵ /⍨0≠(w,1)×1,w← 2{(~q)+(⍺+⍵ )×q← ⍺<⍵ }/⍵ } ⍝ reduce connected chunks
m← {(r ⍣ {(⍴ ⍺) = ⍴ ⍵ }) ⍵ } ¨ f ⍝ do r until all chunks reduced

+/{↑ (0 >⍨ ⍵ ) / ⍵ } ¨ m ⍝ part 1

i← ⌽ ¨m/⍨ 0=+/⊃ 0>⍨m ⍝ find all lines with incomplete chunks
y[⍋ y] ⌷⍨ ⌈2÷⍨⍴ y← {{⍺+5×⍵ }/0,⍨⍵ }¨⌽ ¨(1×¯3=i)+(2×¯57=i)+(3×¯1197=i)+(4×¯25137=i) ⍝ part 2

)OFF
