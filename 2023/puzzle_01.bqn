#! /usr/bin/env bqn

⟨B10⟩ ← •Import "idioms.bqn"

input ← •FLines "files/1.txt"
i ← 1+↕9
n ← ⟨ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ⟩
m ← ≍¨ '0' + i

S ← +´·(/+´¨)⊸(B10 0‿¯1 ⊏ i ⊏˜ 9 | {⍋⍷∾/¨𝕩}∘⊏ ⊏ ⊣)˘·⍉⍷⌜

•Show input S˜ m # part 1
•Show input S˜ m ∾ n # part 2
