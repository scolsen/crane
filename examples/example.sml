datatype 'a nat  = ZERO | SUCC of 'a

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
  | an n = (SUCC (n -1))

fun tos ZERO     = "zero"
  | tos (SUCC n) = "succ" ^ "(" ^ n ^ ")"

val p = Natfolds.fold su (Natfolds.identity)
val k = Natfolds.unfold an 3
val _ = print (Int.toString p)
val _ = print (Natfolds.fold tos k) (* fold back to string to display. Note this
is a fold after an unfold.*)

