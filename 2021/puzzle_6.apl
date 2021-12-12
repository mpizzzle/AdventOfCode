#! /usr/bin/apl --script

input← ⍎'3,4,3,1,2'
input← 300 ⍴ ⊃ ⍎⎕FIO[49] 'files/6.txt'

⍴ { (c↓ d),⍨ 7 | d↑⍨ c← +/7<⍨ d← 1-⍨⍵ ,9/⍨+/0=⍵  } ⍣ 80 input ⍝ part 1

)OFF
