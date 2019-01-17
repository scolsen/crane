datatype 'a tree  = TERMINUS | BRANCH of 'a * 'a * 'a

structure Tree : FUNCTOR =
  struct
    type 'a F = 'a tree
    val identity = TERMINUS

    fun fmap _ TERMINUS       = TERMINUS
      | fmap f (BRANCH (l, x, r)) = (BRANCH ((f l), (f x), (f r))) 
  end

structure TreeFix   = Fix(structure Functor = Tree) 
structure Treefolds = Folds(structure Category = TreeFix)

fun tr TERMINUS = 0
  | tr (BRANCH (l, x, r)) = l + x + 1 + r 

fun br 0 = TERMINUS
  | br n = BRANCH ((n - 1), 0, (n - 1))

fun trs TERMINUS = "Terminus"
  | trs (BRANCH (l, x, r)) = "\n" ^ l ^ "\t"^ x ^ "\t" ^ r

fun lefts TERMINUS = 0
  | lefts (BRANCH (l, _, _)) = l + 1

val q = Treefolds.cata tr (Treefolds.identity)
val b = Treefolds.ana br 4
val leftys = Treefolds.hylo lefts br 2
val _ = print (Int.toString q)
(* fold back to string to display. Note this
is a fold after an unfold.*)
(* val _ = print (Treefolds.hylo trs br 8) *)
val _ = print (Int.toString leftys)

