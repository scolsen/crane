datatype 'a nat = ZERO | SUCC of 'a

structure Nat : FUNCTOR =
  struct
    type 'a t = 'a nat 
    val identity = ZERO
    fun fmap ZERO = ZERO
      | fmap f (SUCC x) = (f x)
  end

structure Natf = Folds(structure Functor = Nat)
