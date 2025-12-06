#! /usr/bin/env bqn

⟨Part, ToNat⟩ ← •Import "../2024/idioms.bqn"

input ← •FLines "files/6.txt"

Flip ← <˘·⍉>
Out ← •Show · +´ ((⊑'*'=⊑) ⊣◶⟨+´, ×´⟩ ·ToNat¨ 1⊸↓)¨

Out Flip ⌽ ' '⊸≠⊸Part¨ input # part 1
Out (¯1⊸↓⌾(1⊸⊑) (¯1⊑⊑)⊸∾)¨ (0<≠¨)⊸Part ' '⊸≠⊸/¨ Flip input # part 2
