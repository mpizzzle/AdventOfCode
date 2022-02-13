#!/usr/bin/env BQN

input ← •FLines "files/23.txt"

S ← "⋄1" ∾˜ (∾(1⊸⊑) ∾ " ↩ " ⌾ (0⊸⊑)∾⊣)
J ← ∾ ')' ∾˜ ⊣ { 𝕨 ⌾(1⊸⊑) 𝕩 } ⊢⟜(⌽⌾(2⊸↑))

e‿o ← "((1×1⊸⊣=2|⊢)+(⊣×0⊸⊣=2|⊢))˜("‿"((1×1≠⊢)+(⊣×1=⊢))˜("
labels ← "hlf"‿"tpl"‿"inc"‿"jmp"‿"jie"‿"jio"
instructions ← ("÷2"⊸S)‿("×3"⊸S)‿("+1"⊸S)‿(1⊑⊢)‿(e⊸J)‿(o⊸J)

Partition ← ' '((⊢-˜+`×¬)∘=⊔⊢)⊢/˜','≠⊢
GetInstruction ← (/labels∊⊢) ◶ instructions

program ← GetInstruction∘Partition ¨ input

Execute ← {
  repl ← •ReBQN {repl ⇐ "strict"}
  REPL ¨ 𝕨
  ((REPL∘(program ⊑˜ ⊢)+⊢) ⍟ 𝕩) 0
  •Show REPL "b"
}

"b←0"‿"a←0" Execute 1484 # part 1
"b←0"‿"a←1" Execute 1936 # part 2
