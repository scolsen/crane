datatype 'a nat = ZERO | SUCC of 'a

structure Nat : FUNCTOR =
  struct
    type 'a F = 'a nat
    val identity = ZERO
    
    fun fmap _ ZERO     = ZERO
      | fmap f (SUCC x) = (SUCC (f x))
  end

structure NatFix = Fix(structure Functor = Nat)
structure Natfolds = Folds(structure Fixpoint = NatFix)

fun su ZERO     = 0
  | su (SUCC n) = n + 1

fun an 0 = ZERO (* unfold *)
  | an n = (SUCC (n - 1))

fun tos ZERO     = "zero"
  | tos (SUCC n) = "succ" ^ "(" ^ n ^ ")"

fun go ZERO = 0
  | go (SUCC (_, n)) = n + 1

fun ap 0 = ZERO
  | ap n = (SUCC (Right (n - 1)))


val p = Natfolds.cata su (Natfolds.identity)
val k = Natfolds.ana an 3
val w = Natfolds.para go k
val z = Natfolds.apo ap 5

val _ = print (Int.toString w)
val _ = print (Int.toString p)
val _ = print (Natfolds.hylo tos an 4) 
val _ = print (Natfolds.cata tos z) 

