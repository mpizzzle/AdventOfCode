#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/4.txt'

numbers← 1 + ⍎↑ input
table_rows← 1 + ⍎ ¨ ((⍴ s) ⍴ ⍉ ∊ { 0 < ⍴ ⍵ } ¨ s) / s← 1↓ input
t← {⊃ table_rows ⌷⍨⊂ (⍵ × 5) + ⍳5} ¨ 1 -⍨ ⍳5 ÷⍨ ⍴ table_rows ⍝ table matrices

p← { { (1++/+⌿⍵ - 0 >⍨ ⍵ ) × {(0 ∊ +⌿⊃ ⍵ )∨ 0 ∊ +/⊃ ⍵ } ⍵ } ¨ ⍵ } ⍝ calculate winners
b← { ⊃ { ⍵ × ⍺ ≠ ⍵ }/(⌽ ⍵ ↑ numbers),⊂ t } ⍝ calculate reduced bingo round
w← { ⍵ /1 i⍴ ⍳i← ≢ ⍵ } ⍝ where (⍸)

all← {p b ⍵ } ¨ ⍳⍴ numbers

(1 -⍨ j⊃ a) × (numbers ⊃ ⍨ j← ↑ w a← +/¨all) - 1 ⍝ part 1
(1 -⍨ numbers ⊃ ⍨ s) × (((1/⍨⍴ t) - 0 >⍨ p b s - 1) / (s← ↑ ⊃ w (⍴ t) = g← +/ ¨ 0 >⍨ all) ⊃ all) - 1 ⍝ part 2

)OFF
