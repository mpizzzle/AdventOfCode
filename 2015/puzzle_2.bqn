#!/usr/bin/env BQN

input ← •BQN ¨ {'‿'¨⌾(('x'=𝕩)⊸/)𝕩} ¨ •FLines "files/2.txt"

•Show +´ (⌊´¨++´¨2⊸×) (×´¨⊢⋈¨1⊸⌽)¨input #part 1
•Show +´(×´+2×+´-⌈´)¨input #part 2
