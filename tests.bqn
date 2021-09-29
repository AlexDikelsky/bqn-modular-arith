mod ← •Import "mod.bqn"

Xgcd ← mod.Xgcd
ModInverse ← mod.ModInverse
ZCross ← mod.ZCross

! (1 Xgcd 5) ≡ ⟨1, 1, 0⟩
! (2 Xgcd 5) ≡ ⟨1, -2, 1⟩
! (3 Xgcd 5) ≡ ⟨1, 2, -1⟩
! (4 Xgcd 5) ≡ ⟨1, -1, 1⟩

! (0 Xgcd 0) ≡ ⟨0, 0, 0⟩

! (100 Xgcd 100) ≡ ⟨100, 1, 0⟩
! (23 Xgcd 23) ≡ ⟨23, 1, 0⟩

size ← 40
identityMatrix ← =⌜˜↕size
postable ← Xgcd⌜˜↕size
negTable ← - posTable
posNegNums ← (size÷2)-↕size
posNegTable ← Xgcd⌜˜ posNegNums
# Assert that the Bézout coefficients are flipped between (x Xgcd y) and (y Xgcd x)
! ∧´∧˝ identityMatrix ∨ {(1 ⊑¨ 𝕩) = (2 ⊑¨ ⍉ 𝕩)} posTable
! ∧´∧˝ identityMatrix ∨ {(1 ⊑¨ 𝕩) = (2 ⊑¨ ⍉ 𝕩)} negTable

# Check that the Bézout coefficients actually work
CheckBez ← {
   g‿s‿t ← 𝕩
   x‿y ← 𝕨
   g = (x×s) + (y×t)
}⚇1

! ∧´∧˝ (≍⌜˜ posNegNums) CheckBez posNegTable

# Mod Inverse
! 1 = ModInverse ⟨1, 2⟩
p ← 2039
CheckInverses ← {
  nums ← ZCross 𝕩 
  ! ∧´ 𝕩 | nums × ModInverse¨ nums∾¨(≠nums)⥊𝕩
}
CheckInverses 2039
CheckInverses 7
CheckInverses 15 
CheckInverses size

# ZCross
! ⟨1, 2, 4, 5, 7, 8⟩ ≡ ZCross 9
! ⟨1, 3, 5, 7, 9, 13, 15, 17, 19, 21⟩ ≡ ZCross 22
! (1+↕(p-1)) ≡ ZCross p
