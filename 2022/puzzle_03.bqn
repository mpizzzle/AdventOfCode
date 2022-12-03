#! /usr/bin/env BQN

input ← •FLines "files/3.txt"

Intersect ← ⊑(∊/⊣)´
Priority ← (+´⊢+58×0⊸>) '`'-˜⊢

•Show Priority Intersect∘((÷⟜2≤↕)∘≠⊸⊔)¨ input # part 1
•Show Priority Intersect¨(⊢⊔˜3/(↕3÷˜≠)) input # part 2
