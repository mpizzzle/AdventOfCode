#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/10.txt'

g← {(2|⍳2×⍴⍵ )⊂ 2/⍵ }¨input
a← +⌿+/(3×g=')') (¯3×g='(') (57×g=']') (¯57×g='[') (1197×g='}') (¯1197×g='{') (25137×g='>') (¯25137×g='<')

r← {⍵ /⍨ 1,2 = 2+/ 0≠1,⍨2 {(~q) + (⍺+⍵ ) × q← ⍺ < ⍵ } / ⍵ }
+/{↑ (0 >⍨ t) / t← (r ⍣ {(⍴ ⍺) = ⍴ ⍵ }) ⍵ } ¨ {(2⌷⍴ b)⍴ b← ⍉ ⊃ ⍵ } ¨ ⊃ a ⍝ part 1

)OFF
