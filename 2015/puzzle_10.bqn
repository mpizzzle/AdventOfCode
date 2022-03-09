#!/usr/bin/env BQN

input ← "1113222113"

F ← ¬0∾=˝∘(⍉2⊸↕)
LookAndSay ← ∾(@+48+-˝∘⌽∘(⍉2↕/)∘(F'0'∾˜⊢))∾¨/˜⟜F

≠LookAndSay ⍟ 40 input # part 1
≠LookAndSay ⍟ 50 input # part 2
