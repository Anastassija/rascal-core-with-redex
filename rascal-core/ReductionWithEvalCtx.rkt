#lang racket
(require redex)
(require redex/reduction-semantics)
(require "LangDef.rkt")
(provide CoreRascalEvalCtxConfig)
(provide sum)
(provide reduce)
(define-extended-language CoreRascalEvalCtxConfig CoreRascal
  (E (v E)
     (E Exp)
     (+ E Exp)
     (+ v E)
     (== v Exp)
     (== E Exp)
     (:= Id E)
     (if E Exp Exp)
     (: ($ Id) E)
     (create E)
     (resume E)
     (yield E)
     (abort E)
     (callcc E)
     (list Exp ... E Exp ...)
     (fix E)
     hole)
  (v boolean
     integer
     (λ Id Exp)
     ($ Id)
     (const Id)
     (list v ...)
     (fix v))
)

(define-metafunction CoreRascalEvalCtxConfig
  sum : integer integer -> integer
  [(sum integer integer)
   ,(apply + (term (integer integer)))]
  )

(define reduce
  (reduction-relation
   CoreRascalEvalCtxConfig
   (--> (in-hole E (if #t Exp_1 Exp_2))
        (in-hole E Exp_1)
        "if true"
    )
   (--> (in-hole E (+ integer integer))
        (in-hole E (sum integer integer))
        "+")
   )
  )