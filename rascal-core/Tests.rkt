#lang racket
(require redex)
(require redex/reduction-semantics)
(require redex/pict)
(require "LangDef.rkt")
(require "ReductionWithEvalCtx.rkt")

(redex-match
 CoreRascal
 Exp
 (term (if (== 1 1) (+ 2 3) (:= x 4)))
 )

(redex-match
 CoreRascal
 Exp
 (term (if (== 1 1) (+ 2 3) (:= x 4)))
)

(redex-match
 CoreRascal
 Exp
 (term ((λ x x) (+ 1 2)))
 )

(redex-match
 CoreRascal
 Exp
 (term (if #t (+ 1 1) 2))
 )

(traces reduce
        (term (if #t (+ 1 1) 2)))

(render-reduction-relation reduce)
(render-term CoreRascal (λ (x) x))