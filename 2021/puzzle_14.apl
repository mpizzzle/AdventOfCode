#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/14.txt'

pad← {⊂(1 -⍨ 2 × ⍴ ⍵) ⍴ ∊⍵,¨' '/⍨⍴⍵} ⍝ insert space between every char in string
rules← {((↑↑⍵),' ',↑⌽↑⍵) (↑⌽⍵)} ¨ {⍵⊂⍨~⍵∊'-> '} ¨ 2 ↓ input ⍝ formatted rules
insert← {∊ a ({(k↑y),,/(k←3-⍨⍴y)↓y←1⌽(⊂1⍴⍺),⍨¯1⌽⍵} ⍣ d) (1↓(d←(' '≠a←↑⌽⍺)×+/⍵ ⍷⍨ ↑⍺),⍵⊂⍨~¯1⌽⍵ ⍷⍨ ↑⍺)} ⍝ apply rule

q←{+/+⌿⍵} ¨ ⎕AV[65+⍳26] ∘.= ({insert / rules,pad ⊃ ⍵} ⍣ 10) 1 ⌷ input ⍝ find quantities
(↑f) - ↑⌽f← o /⍨ 0 ≠ o←q[⍒ q] ⍝ part 1

)OFF
