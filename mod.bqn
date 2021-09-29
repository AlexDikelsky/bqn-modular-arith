⟨
  Xgcd,
  Gcd,
  Crt,
  ModInverse,
  ZCross,
⟩⇐


# Input: 2 integers
Xgcd ← {
  0 𝕊 0: ⟨0, 0, 0⟩ ;
  0 𝕊 b: ⟨b, 0, 1⟩ ;
  a 𝕊 b: {
    g‿s‿t ← (a | b) Xgcd a
    ⟨g, t - (s × (⌊ b ÷ a)), s⟩ } }⚇0

Gcd ← {
  0 ⊑ 𝕨 Xgcd 𝕩
}⚇0

# Input: ⟨a, m_1⟩ Crt ⟨b, m_2⟩
Crt ← {
  a1‿n1 ← 𝕨
  a2‿n2 ← 𝕩
  gcd‿m1‿m2 ← n1 Xgcd n2
  ("Gcd of " ∾ ('0' + n1) ∾ " and " ∾ ('0' + n2) ∾ " isn't 1") ! gcd = 1
  x1 ← (a1 × m2 × n2) + (a2 × m1 × n1)
  x2 ← n1 × n2
  sol ← x2 | x1
  ⟨sol, n1 × n2⟩
}⚇1

ModInverse ← {
  a‿m ← 𝕩 
  g‿x‿y ← a Xgcd m
  ! g = 1
  x
}⚇1

# Probably a very slow way to do this
ZCross ← {
  n ← ↕𝕩
  (1= 𝕩 Gcd n) / n
}⚇0
