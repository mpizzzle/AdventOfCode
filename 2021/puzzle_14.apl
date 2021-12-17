#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/14.txt'

pad← {(1 -⍨ 2 × ⍴ ⍵) ⍴ ∊⍵,¨' '/⍨⍴⍵}
r← {((↑↑⍵),' ',↑⌽↑⍵) (↑⌽⍵)} ¨ {⍵⊂⍨~⍵∊'-> '} ¨ 2 ↓ input
s←{∊ a ({((3-⍨⍴y)↑y),,/(3-⍨⍴y)↓y←1⌽(⊂1⍴⍺),⍨¯1⌽⍵} ⍣ d) (1↓(d←(' '≠a←↑⌽⍺)×+/⍵ ⍷⍨ ↑⍺),⍵⊂⍨~¯1⌽⍵ ⍷⍨ ↑⍺)}
c←({s/r, ⊂ pad ⊃ ⍵} ⍣ 10) 1 ⌷ input

(↑⌽f)-⍨↑f←o/⍨0≠o←l[⍒l←{+/+⌿⍵} ¨ 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' ∘.= c] ⍝ part 1

)OFF


