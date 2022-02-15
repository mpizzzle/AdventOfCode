#!/usr/bin/env BQN

input ← ⊑ •FLines "files/12.txt"

•Show +´ •BQN ¨ (('-'∾'0'+↕10)∊˜⊢)⊸((¬-˜⊢×·+`»⊸>)⊸⊔) input # part 1
