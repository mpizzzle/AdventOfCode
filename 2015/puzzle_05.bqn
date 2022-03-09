#! /usr/bin/env BQN

input ← •FLines "files/5.txt"
no ← "ab"‿"cd"‿"pq"‿"xy"

•Show +´((3≤+´∘∊⟜"aeiou") ∧ (1≤+´∘(=´˘2⊸↕)) ∧ (¬(∨´no∊(<˘2⊸↕))))¨ input # part 1
•Show +´(((⊑=⊑∘⌽)˘3⊸↕) ∧○(∨´) 1<(|∘-´¨/˜1<≠¨)∘⊔∘(⊐2⊸↕))¨ input # part 2
