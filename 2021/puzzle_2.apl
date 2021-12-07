#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/2.txt'

x← { +/⍵ { 1 ⍴ (⍺ = ⍵) × ⍎⍵[⍴ ⍵] } ¨ input } ¨ 'fdu'

x[1] × (x[2] - x[3]) ⍝ part 1

)OFF
