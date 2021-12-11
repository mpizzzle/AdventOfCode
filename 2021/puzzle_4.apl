#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/4.txt'

numbers← 1 + ⍎↑ input
table_rows← 1 + ⍎ ¨ ((⍴ s) ⍴ ⍉ ∊ { 0 < ⍴ ⍵ } ¨ s) / s← 1↓ input
tables← {⊃ (⊂ (⍵ × 5) + ⍳5)⌷ table_rows} ¨ 1 -⍨ ⍳5 ÷⍨ ⍴ table_rows

p← { { (1++/+⌿⍵ - 0 >⍨ ⍵ ) × {(0 ∊ +⌿⊃ ⍵ )∨ 0 ∊ +/⊃ ⍵ } ⍵ } ¨ ⍵ }
b← { ⊃ { ⍵ × ⍺ ≠ ⍵ }/(⌽ ⍵ ↑ numbers),⊂ tables }
w← { ⍵ /1 t⍴ ⍳t← ≢ ⍵ }

all← {p b ⍵ } ¨ ⍳⍴ numbers
(1 -⍨ i⊃ a) × (numbers ⊃ ⍨ i← ↑ w a← +/¨all) - 1 ⍝ part 1

s← ↑ ⊃ w (⍴ tables) = g← +/ ¨ 0 >⍨ all
(1 -⍨ numbers ⊃ ⍨ s) × (((1/⍨⍴ tables) - 0 >⍨ p b s - 1) / s ⊃ all) - 1  ⍝ part 2

)OFF
