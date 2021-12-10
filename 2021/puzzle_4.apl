#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/4.txt'

numbers← 1 + ⍎↑ input
table_rows← 1 + ⍎ ¨ ((⍴ s) ⍴ ⍉ ⊃ ⊃ { 0 < ⍴ ⍵  } ¨ s) / (s← 1↓ input)
tables← {⊃ (⊂ (5 × ⍵ ) + ⍳5)⌷ table_rows} ¨ (⍳((⍴ table_rows) ÷ 5)) - 1

p← { +/{ (+/+⌿(⍵ - 0 >⍨ ⍵ ) ) × ((0 ∊ +⌿⊃ ⍵ )∨ (0 ∊ +/⊃ ⍵ )) } ¨ ⍵ }
b← { ⊃ {(⍺ ≠ ⍵ ) × ⍵ }/((⌽ (⍵ ↑ numbers)),⊂ tables) }

(i⊃ a) × ((i← ↑ { ⍵ / 1 t⍴ ⍳t← ≢ ⍵ } a← {p b ⍵ } ¨ ⍳⍴ numbers > 0) ⊃ numbers) - 1 ⍝ part 1

)OFF
