#!/usr/bin/env BQN

target ← 3400000

Presents ← +´∘∾⟜(1+(/0=(1 + ↕∘(⌈2÷˜⊢))⊸|))

•Show (5040⊸+) {𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩} (¬target ≥˜ Presents∘⌊) 0
