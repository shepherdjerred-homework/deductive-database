(progn
  (load "../src/unify.lisp")
  (load "../src/ddb.lisp")
  (setq db
    '(
      (T (dog fido))
      (T dog lassie)
      ((dog x1 (mammal x1)))
      (mammal x1) (wb x2)
      ((cat x3) (feline x3))
      (T (cat felix))
      ((man x4) (mortal x4))
      (T (man Socrates))
      (T (man Plato))
      ((dog x5) (likes Pavlov x5))
      ((dog x6 (mortal x6)))
      ((man x7) (mammal x7))
      ((feline x8) (mammal x8))
      ((lion x9) (feline x9))
      (T (lion leo))
      ((feline x10) (mortal x10))
      ((likes Pavlov x11) (hates x11 x12))
      ((student x13) (hates x13 homework))
      (T (student John))
      (T (student Mary))
      ((dog x14) (hates John x14))))
  (trace ?))

(and
  (equal
    (?
      '(mortal x))
    '(SOCRATES PLATO FIDO LASSIE FELIX LEO))
  (equal
    (?
      '(mortal fido))
    'YES) 
  (equal
    (?
      '(dog socrates))
    'NO)
  (equal
    (?
      '(likes y fido))
    '(PAVLOV))
  (equal
    (?
      '(hates y fido))
    '(FIDO LASSIE JOHN))
  (equal
    (?
      '(hates fido y))
    'YES)
  (equal
    (?
      '(mammal z))
    '(FIDO LASSIE SOCRATES PLATO FELIX LEO))
  (equal
    (?
      '(wb z))
    '(FIDO LASSIE SOCRATES PLATO FELIX LEO)))

