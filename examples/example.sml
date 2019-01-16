datatype 'a nat   = ZERO | SUCC of 'a
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

structure Nat : FUNCTOR =
  struct
    type 'a F = 'a nat
    val identity = ZERO
    
    fun fmap _ ZERO     = ZERO
      | fmap f (SUCC x) = (SUCC (f x))
  end

structure NatFix = Fix(structure Functor = Nat)
structure Natfolds = Folds(structure Category = NatFix)

fun su ZERO     = 0
  | su (SUCC n) = n + 1

fun an 0 = ZERO (* unfold *)
  | an n = (SUCC (n - 1))

fun tos ZERO     = "zero"
  | tos (SUCC n) = "succ" ^ "(" ^ n ^ ")"

fun tr TERMINUS = 0
  | tr (BRANCH (l, x, r)) = l + x + 1 + r 

fun br 0 = TERMINUS
  | br n = BRANCH ((n - 1), 0, (n - 1))

fun trs TERMINUS = "Terminus"
  | trs (BRANCH (l, x, r)) = "\n" ^ l ^ "\t"^ x ^ "\t" ^ r

fun lefts TERMINUS = 0
  | lefts (BRANCH (l, _, _)) = l + 1

fun go ZERO = 0
  | go (SUCC (_, n)) = n + 1

fun ap 0 = ZERO
  | ap n = (SUCC (Right (n - 1)))

val p = Natfolds.cata su (Natfolds.identity)
val k = Natfolds.ana an 3
val w = Natfolds.para go k
val q = Treefolds.cata tr (Treefolds.identity)
val b = Treefolds.ana br 4
val z = Natfolds.apo ap 5
val leftys = Treefolds.hylo lefts br 2
val _ = print (Int.toString w)
val _ = print (Int.toString p)
val _ = print (Int.toString q)
val _ = print (Natfolds.hylo tos an 4) 
val _ = print (Natfolds.cata tos z) 
(* fold back to string to display. Note this
is a fold after an unfold.*)
(* val _ = print (Treefolds.hylo trs br 8) *)
val _ = print (Int.toString leftys)

