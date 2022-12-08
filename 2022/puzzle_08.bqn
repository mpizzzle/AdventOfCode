#! /usr/bin/env BQN

input ← '0' -˜ •FLines "files/8.txt"

x← 10‿10↑ > input
idx ← 5
lol ← > input

test ← > '0' -˜ ⟨"30373",
"25512",
"65332",
"33549",
"35390"⟩

I ← =⌜○↕´∘≢

# slice the matrix into 4 cardinal slices
# for each point on each slice, do F
# map back to matrix, add all 4 back
# sum all

# function that generates all 4 array intersections for each point (is this slow?)

# function that takes an array and an index, returns true if number at index > than every number in one or more directions

B ← (1+⊣)⊸↑
A ← ⌽↓
F ← 0 < A +○((⊢×<)´) B

s ← ⍉>{ (𝕩⊸F˘ 1+x) }¨ ↕10
j ←  >{ (𝕩⊸F˘⍉1+x) }¨ ↕10

one ← ⍉>{ (𝕩⊸F˘ 1+test) }¨ ↕5
two ←  >{ (𝕩⊸F˘⍉1+test) }¨ ↕5

lolone ← ⍉>{ (𝕩⊸F˘ 1+lol) }¨ ↕99
loltwo ←  >{ (𝕩⊸F˘⍉1+lol) }¨ ↕99

#x
+´+˝lolone ∨ loltwo

#x
id ← (I x)
id2 ← (I test)

#q ← { (¯1×𝕩)↓+˝(1+x) × »⍟𝕩 id } ¨ ↕10

#{ { 5 F 𝕩 } •Show 𝕩 ⊑ q }¨ ↕10
#5 F
#{ 𝕩 F¨+˝¨q }¨↕10
diagstest ← (⌽1 ↓ { (1+test) × »⍟𝕩 id2 } ¨ ↕5) ∾ { (1+test) × «⍟𝕩 id2 } ¨ ↕5
diagstest2 ← (⌽1 ↓ { (1+test) × »⍟𝕩 ⌽id2 } ¨ ↕5) ∾ { (1+test) × «⍟𝕩 ⌽id2 } ¨ ↕5

ff ← { 𝕩⊸{ 𝕩 F 𝕨 ⊑ (+˝¨diagstest) }¨ ↕5 }¨ ↕9
gg ← { 𝕩⊸{ 𝕩 F 𝕨 ⊑ (+˝¨diagstest2) }¨ ↕5 }¨ ↕9
three ← ∨´0<⍉¨ff × ⍉¨diagstest
four ← ∨´0<⍉¨gg × ⍉¨diagstest2

one ∨ two


diags ← (⌽1 ↓ { (1+x) × »⍟𝕩 id } ¨ ↕10) ∾ { (1+x) × «⍟𝕩 id } ¨ ↕10
diags2 ← (⌽1 ↓ { (1+x) × »⍟𝕩 ⌽id } ¨ ↕10) ∾ { (1+x) × «⍟𝕩 ⌽id } ¨ ↕10

diags

dd ← { 𝕩⊸{ 𝕩 F 𝕨 ⊑ (+˝¨diags) }¨ ↕10 }¨ ↕19
ee ← { 𝕩⊸{ 𝕩 F 𝕨 ⊑ (+˝¨diags2) }¨ ↕10 }¨ ↕19
h ← ∨´0<⍉¨dd × ⍉¨diags
o ← ∨´0<⍉¨ee × ⍉¨diags2

s ∨ j ∨ h ∨ o

diags × dd

{ 𝕩 {𝕩⊸F¨ 𝕨}¨ ↕≠𝕩 } ((∨`∧∨`⌾⌽)0⊸≠)⊸/¨(+˝¨diags)

 { 𝕩⊸F¨ (+˝¨diags) }¨ ↕10

>{𝕩⊸{ 𝕩⊸F (+˝𝕨 ⊑ diags) }¨↕10 } ¨↕10


{(+˝ x × (0×↕𝕩) » id)}¨↕10
{ (𝕩⊸F˘ 1 + ) }¨ ↕10

#a ← +˝x × I x
#b ← ↕10
#a
#idx { (1+𝕨) ↑ ⌽𝕩 } b
#idx { (⌽(1-˜𝕨) ↓ 𝕩) } b
#
#idx { ((1+𝕨) ↑ ⌽𝕩) +○((⊢×<)´) (𝕨 ↑ 𝕩) } b
#
#y ← x⊸{ 𝕨 × 𝕨 ≥ 𝕩 }¨ ↕10
