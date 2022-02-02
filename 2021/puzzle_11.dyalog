test ← ⍎ ¨ 10 10 ⍴ '5483143223274585471152645561736141336146635738547841675246452176841721688288113448468485545283751526'
input ← ⍎ ¨ 10 10 ⍴ '1443582148655373485114517412468835218864166231726217316566231128178367584235166566773268437381433267'

f ← 9>⍨⊢ ⍝ boolean matrix of flashes
z ← ⊢×~⍤f⍤⊢ ⍝ zero out flashes
c ← 100=+/⍤(+⌿=⍥f) ⍝ compare boolean matrices
s ← ((+/+⌿⍤⊢) ⌺ 3 3)⍤f⍤⊢ ⍝ sum stencil of flashing neighbours
g ← s+⍨1+⊃⍤⊣ ⍝ sum stencil + ⍵ + 1

Dumbo ← { (⊂ z (⍵g⊢) ⍣ (⊢c⍵g⊢) 1 + ⊃⍵) , ⍺⍺ ⍵ } ⍝ generate next round

+/+⌿ ⊃ +⌿ 0 = ((⊢ Dumbo) ⍣ 100) ⊂ input ⍝ part 1
1 -⍨ 1 ↓ ((1+1↓⊢) Dumbo) ⍣ (0=(+/+⌿⍤⊃⍤⊢)) input 0 ⍝ part 2
