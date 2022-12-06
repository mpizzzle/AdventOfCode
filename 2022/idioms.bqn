#! /usr/bin/env BQN

ToInt ⇐ (10⊸×⊸+˜´∘⌽-⟜'0')'0'⊸∾ # Parse natural number from string (zero on empty)
Part ⇐ (¬-˜⊢×·+`»⊸>)⊸⊔ # Cut ⊢ at 0s in ⊣, giving a slice for each group of 1s
Trim ⇐ (∨⟜«' '⊸≠)⊸/ # Remove trailing and duplicate blanks
