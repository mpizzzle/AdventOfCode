#! /usr/bin/env BQN

input ← ⊑ •FLines "files/6.txt"

•Show input⊸(⊑/∘(⌊´∘∊˘↕˜)+⊢)¨ 4‿14 
