#! /usr/bin/apl --script

input←{⍎(⍴x)[2]⍴x←0 ⎕CR ⍵} ⎕FIO[49] 'files/1.txt'
(+/(((input,0)-(0,input))>0))-1 ⍝ part 1

i←((0,0),input)+((0,input),0)+((input,0),0)
(+/(((i,0)-(0,i))>0))-3 ⍝ part 2

)OFF
