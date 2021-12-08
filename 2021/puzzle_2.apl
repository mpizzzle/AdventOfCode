#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/2.txt'

x← { ⍵ { 1 ⍴ (⍺ = ⍵) × ⍎⍵[≢ ⍵] } ¨ input } ¨ 'fdu'

y[1] × y[2] - (y← +/¨ x)[3] ⍝ part 1

f← { 0 0 ⍺ ↓⍤3⍵ }
+/z × +/(+\⊢/1 f -\1 f y) × z← ⊢/2 f⌽ y← ⊃ (⊂ ⍤1)⍉ ⊃ ⊃ x ⍝ part 2

)OFF
