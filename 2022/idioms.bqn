#! /usr/bin/env BQN

# Parse natural number from string (zero on empty)
ToInt ⇐ (10⊸×⊸+˜´∘⌽-⟜'0')'0'⊸∾

# Cut ⊢ at 0s in ⊣, giving a slice for each group of 1s
Part ⇐ (¬-˜⊢×·+`»⊸>)⊸⊔

# Remove trailing and duplicate blanks
Trim ⇐ (∨⟜«' '⊸≠)⊸/
