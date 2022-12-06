#! /usr/bin/env BQN

ToInt ⇐ (10⊸×⊸+˜´∘⌽-⟜'0')'0'⊸∾
Part ⇐ (¬-˜⊢×·+`»⊸>)⊸⊔
Trim ⇐ (∨⟜«' '⊸≠)⊸/ 
