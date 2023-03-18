(define-fun domaine ((x Int)) Bool  (and (> x 0) (< x 6)))

;Shirt:
(declare-const S1 Int) ;Black
(declare-const S2 Int) ;Blue
(declare-const S3 Int) ;Purple
(declare-const S4 Int) ;Red
(declare-const S5 Int) ;White
;Name:
(declare-const N1 Int) ;Bethany
(declare-const N2 Int) ;Jacquelin
(declare-const N3 Int) ;Leah
(declare-const N4 Int) ;Olivia
(declare-const N5 Int) ;Sydney
;Kind:
(declare-const K1 Int) ;dark
(declare-const K2 Int) ;milk
(declare-const K3 Int) ;organic
(declare-const K4 Int) ;vegan
(declare-const K5 Int) ;white
;Weight:
(declare-const W1 Int) ;100 g
(declare-const W2 Int) ;150g
(declare-const W3 Int) ;200g
(declare-const W4 Int) ;250g
(declare-const W5 Int) ;300g
;Brand:
(declare-const B1 Int) ;Germany
(declare-const B2 Int) ;Italy
(declare-const B3 Int) ;New Zealand
(declare-const B4 Int) ;Switerland
(declare-const B5 Int) ;USA
;Age:
(declare-const A1 Int) ;20 years
(declare-const A2 Int) ;22 years
(declare-const A3 Int) ;24 years
(declare-const A4 Int) ;26 years
(declare-const A5 Int) ;28 years

;;On s'assure que chaque catégorie n'est attribué qu'à une femme 
(assert(distinct S1 S2 S3 S4 S5))
;;Et qu'on ai bien 5 que personnes
(assert (domaine S1))
(assert (domaine S2))
(assert (domaine S3))
(assert (domaine S4))
(assert (domaine S5))
(assert(distinct N1 N2 N3 N4 N5))
(assert (domaine N1))
(assert (domaine N2))
(assert (domaine N3))
(assert (domaine N4))
(assert (domaine N5))
(assert(distinct K1 K2 K3 K4 K5))
(assert (domaine K1))
(assert (domaine K2))
(assert (domaine K3))
(assert (domaine K4))
(assert (domaine K5))
(assert(distinct W1 W2 W3 W4 W5))
(assert (domaine W1))
(assert (domaine W2))
(assert (domaine W3))
(assert (domaine W4))
(assert (domaine W5))
(assert(distinct B1 B2 B3 B4 B5))
(assert (domaine B1))
(assert (domaine B2))
(assert (domaine B3))
(assert (domaine B4))
(assert (domaine B5))
(assert(distinct A1 A2 A3 A4 A5))
(assert (domaine A1))
(assert (domaine A2))
(assert (domaine A3))
(assert (domaine A4))
(assert (domaine A5))

;;Traduction des contraintes
;;The youngest woman(A1) is exactly to the right of the 24-year-old woman(A3).
(assert (= A1 (+ 1 A3)))
;;Olivia(N4) is next to the woman that is eating the 300 g chocolate bar(W5).
(assert (or (= -1 (- N4 W5)) (= 1 (- N4 W5))))
;;The woman wearing the Purple shirt(S3) is somewhere to the left of the woman eating the German chocolate bar(B1).
(assert (< S3 B1))
;;Leah(N3) is next to the woman wearing the Purple shirt(S3).
(assert (or (= -1 (- N3 S3)) (= 1 (- N3 S3))))
;;Olivia(N4) is at the third position.
(assert (= N4 3))
;;The woman wearing the Purple shirt(S3) is 24 years old(A3).
(assert (= S3 A3))
;;The woman eating the 250 g chocolate bar(W4) is somewhere to the right of the woman wearing the Black shirt(S1).
(assert (> W4 S1))
;;The woman eating the White chocolate(K5) is somewhere between the woman eating the 150 g chocolate bar(W2) and the woman eating the Milk chocolate(K2), in that order.
(assert (and (< W2 K5) (< K5 K2)))
;;The woman wearing the Black shirt(S1) is somewhere to the left of the woman eating the Dark chocolate(K1).
(assert (< S1 K1))
;;The woman eating the chocolate from New Zealand(B3) is somewhere to the right of the woman wearing the Black shirt(S1).
(assert (> B3 S1))
;;The woman wearing the White shirt(S5) is somewhere between the woman eating the 150 g chocolate bar(W2) and the 20-year-old woman(A1), in that order.
(assert (and (< W2 S5) (< S5 A1)))
;;The White chocolate(K5) was made in Italy(B2).
(assert (= K5 B2))
;;At the second position is the oldest woman(A5).
(assert (= A5 2))
;;The woman eating the 150 g chocolate bar(W2) is next to the woman eating the 300 g chocolate bar(W5).
(assert (or (= -1 (- W2 W5)) (= 1 (- W2 W5))))
;;The woman wearing the Red shirt(S4) is exactly to the right of the woman wearing the Black shirt(S1).
(assert (= S4 (+ 1 S1)))
;;The 22-year-old woman(A2) is somewhere to the right of the woman wearing the Black shirt(S1).
(assert (> A2 S1))
;;The Vegan chocolate(K4) was made in Switzerland(B4).
(assert (= K4 B4))
;;The woman wearing the White shirt(S5) is somewhere between the woman wearing the Blue shirt(S2) and Sydney(N5), in that order.
(assert (and (< S2 S5) (< S5 N5)))
;;Bethany(N1) is next to the 22-year-old woman(A2).
(assert (or (= -1 (- N1 A2)) (= 1 (- N1 A2))))
;;The 200 g chocolate bar(W3) is White(K5).
(assert (= W3 K5))
;;The woman wearing the White shirt is somewhere to the left of the 22-year-old woman(A2).
(assert (< S5 A2))
;;The 28-year-old woman(A5) is eating the American chocolate bar(B5).
(assert (= A5 B5))

(check-sat)
(get-model)
