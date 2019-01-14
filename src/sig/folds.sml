(* Folds signature *)

signature FOLDS =
  sig
    structure Category : CAT
    val identity : Category.t
    val fold : ('a Category.Functor.F -> 'a) -> Category.t -> 'a
    val unfold : ('a -> 'a Category.Functor.F) -> 'a -> Category.t
    val hylo   : ('a Category.Functor.F -> 'a) -> ('b -> 'b Category.Functor.F)
    -> 'b -> 'a 
  end
