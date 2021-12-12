#! /usr/bin/apl --script

input← i⍴⍨↑⍴⍉ i← ⊃ ⍎⎕FIO[49] 'files/6.txt'

s← {+/⍵ = input} ¨ 1-⍨⍳9
r← {((6/0),(↑⍵ ),2/0) + 1⌽ ⍵ }
+/r⍣80 s ⍝ part 1
+/r⍣256 s ⍝ part 2

)OFF
