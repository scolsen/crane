(* Folds signature *)

signature FOLDS =
  sig
    structure Category : CAT
    val identity : Category.t
    val fold : ('a Category.Functor.F -> 'a) -> Category.t -> 'a
    val unfold : ('a -> 'a Category.Functor.F) -> 'a -> Category.t
  end
