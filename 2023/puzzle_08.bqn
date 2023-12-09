#! /usr/bin/env bqn

⟨Part, LCM⟩ ← •Import "idioms.bqn"

input ← •FLines "files/8.txt"

d ← 'R' = ⊑ input
m ← (∊⚇1⟜('A'+↕26)Part¨⊢) 2↓input
is ← ⊑¨ m
c ← is⊸⊐¨ m
ai‿zi ← ⊑∘/∘∾˘ ("AAA" ⋈ "ZZZ") ⍷⌜ is
as‿zs ← <∘/˘ "AZ" ≡⌜ ¯1⊸⊑¨ is

S ← { (𝕨+1) ⋈ (𝕨 (1+|˜⟜≠⊑⊢) d) ⊑ 𝕩 ⊑ c }´

•Show ⊑ S•_while_ (zi ≢ 1⊸⊑) 0‿ai # part 1
•Show LCM´ ⊑∘(S •_while_ (¬∘⊑ zs ∊˜ ¯1⊸⊑))¨ 0 ⋈¨ as #part 2
