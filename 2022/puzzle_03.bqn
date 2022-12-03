#! /usr/bin/env BQN

input ← •FLines "files/3.txt"

Partition ← (÷⟜2≤↕)∘≠⊸⊔
Intersect ← ⊑(∊/⊣)´
Priority ← (+´⊢+58×0⊸>) '`'-˜⊢
Group ← ⊢⊔˜3/(↕3÷˜≠)

•Show Priority Intersect∘Partition¨ input # part 1
•Show Priority Intersect¨ Group input # part 2
