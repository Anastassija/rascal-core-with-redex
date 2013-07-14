#lang racket
(require redex)
(provide CoreRascal)
(define-language CoreRascal
  (Exp boolean
       integer
       Id
       (λ Id Exp)
       (Exp Exp)
       (+ Exp Exp)
       (== Exp Exp)
       (:= Id Exp)
       (if Exp Exp Exp)
       ($ Id)
       (: ($ Id) Exp)
       (create Exp)
       (resume Exp Exp)
       (yield Exp)
       (abort Exp)
       (callcc Exp)
       (const Id)
       (list Exp...)
       (fix Exp)
  )
  (Id variable-not-otherwise-mentioned)
)
