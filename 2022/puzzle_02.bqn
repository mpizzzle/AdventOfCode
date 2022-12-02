#! /usr/bin/env BQN

input ← <˘ ⍉ "AX" -˜ ⍉> 0‿2⊸⊏¨ •FLines "files/2.txt"

Win ← ⊣=3|1⊸+
GetTotals ← (6⊸×÷+´)∘(⊢=⌈´)∘(Win∾Win˜)´+1⊸+ 
ChooseCounter ← ⊑∾(⊣⊑(↕3)⌽˜1-˜⊢)´

•Show >+˝GetTotals¨ input # part 1
•Show >+˝GetTotals∘ChooseCounter¨ input # part 2
