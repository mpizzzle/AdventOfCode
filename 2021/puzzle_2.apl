#! /usr/bin/apl --script

input← ⎕FIO[49] 'files/2.txt'

c← {↑ ↑ (+/⍤ 1) ⍺ {9 ↑ (⍺ = ⍵ ) × (⍎⍵ [(⍴ ⍵ )]) } ¨ ⍵  }
('f' c input) × (('d' c input) - ('u' c input)) ⍝ part 1

)OFF
