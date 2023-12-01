#! /usr/bin/env bqn

⟨ToNat, B10⟩ ← •Import "idioms.bqn"

input ← •FLines "files/1.txt"
i ← 1 + ↕9
n ← ⟨ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ⟩
g ← n ∾ ≍¨ '0' + i

Part1 ← ToNat 0‿¯1 ⊏ ∊⟜(∾'0'+⟜↕¨10)⊸/
Part2 ← (/+´¨)⊸(B10 0‿¯1 ⊏ i ⊏˜ 9 | {⍋⍷∾/¨𝕩}∘⊏ ⊏ ⊣) g⊸(⍷⚇1)

•Show +´ Part1¨ input
•Show +´ Part2¨ input
