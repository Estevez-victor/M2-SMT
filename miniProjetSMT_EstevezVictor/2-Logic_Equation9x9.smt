(define-fun domaine ((x Int)) Bool  (and (> x 0) (< x 10)) ) 

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const G Int)
(declare-const H Int)
(declare-const I Int)

;;you have to find unique integer values for the variables :
(assert(distinct A B C D E F G H I))
;;ranging from 1 to 9 :
(assert (domaine A))
(assert (domaine B))
(assert (domaine C))
(assert (domaine D))
(assert (domaine E))
(assert (domaine F))
(assert (domaine G))
(assert (domaine H))
(assert (domaine I))

(assert (= (* 4 A) (* 3 G)))
(assert (= (* 4 D) (* 2 H)))
(assert (> C A))
(assert (= H (* 4 F)))
(assert (= B (* 3 I)))

(check-sat)
(get-model)
