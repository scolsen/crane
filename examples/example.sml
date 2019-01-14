datatype 'a nat = ZERO | SUCC of 'a

structure Nat : FUNCTOR =
  struct
    type 'a F = 'a nat
    datatype fix = Fix of fix F
    val identity = ZERO
    fun fmap _ ZERO     = ZERO
      | fmap f (SUCC x) = (SUCC (f x))
  end

structure Natfolds = Folds(structure Functor = Nat)

fun su ZERO     = 0
  | su (SUCC n) = n + 1

val p = Natfolds.fold su (Natfolds.identity)
val _ = print (Int.toString p)
