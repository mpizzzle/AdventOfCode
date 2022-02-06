#!/usr/bin/env BQN

input ← ⊑ •FLines "files/3.txt"

G ← +` ⟨0‿0⟩ ∾ (⟨0‿1,0‿¯1,¯1‿0,1‿0⟩ ⊑˜ (/"^v<>" ⍷˜ ⊢))¨

•Show ≢⍷ G input #part 1
•Show ≢⍷ (∾○G)´ (⊢⊔˜2|↕∘≠) input #part 2
