#! /usr/bin/env BQN

Nat ← 10⊸×⊸+˜´∘⌽-⟜'0'

# Parse natural number from string (zero on empty)
ToNat ⇐ Nat'0'⊸∾

# Parse integer from string
ToInt ⇐ ('-'=⊑)⊸(Nat∘↓ × 1-˜2×¬∘⊣)

# Cut ⊢ at 0s in ⊣, giving a slice for each group of 1s
Part ⇐ (¬-˜⊢×·+`»⊸>)⊸⊔

# Remove trailing and duplicate blanks
Trim ⇐ (∨⟜«' '⊸≠)⊸/

# Return boolean array where 1s are digits 0-9 in ⊢
Digits ⇐ ∊⟜('0'+↕10)

# Split ⊢ at occurrences of separators ⊣, removing the separators
Split ⇐ (⊢-˜+`×¬)∘=⊔⊢

# Split ⊢ into groups of length ⊣, plus a shorter one at the end if needed
Group ⇐ ⌊∘÷˜⟜(↕≠)⊔⊢

# Least Common Muliple of natural numbers ⊣ and ⊢
LCM ⇐ (×÷{𝕨(|𝕊⍟(>⟜0)⊣)𝕩})

# Apply 𝔽 to ⊢ repeatedly until 𝔾 returns 0 (avoiding stack overflow)
_while_ ⇐ {𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}
