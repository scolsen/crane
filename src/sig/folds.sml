(* Folds signature *)

signature FOLDS =
  sig
    structure Category : CAT
    val identity : Category.t
    val cata : ('a Category.Functor.F -> 'a) -> Category.t -> 'a
    val ana : ('a -> 'a Category.Functor.F) -> 'a -> Category.t
    val hylo : ('a Category.Functor.F -> 'a) -> ('b -> 'b Category.Functor.F)
    -> 'b -> 'a
    val para : ((Category.t * 'a) Category.Functor.F -> 'a) -> Category.t -> 'a
    val apo  : ('a -> ((Category.t, 'a) either) Category.Functor.F) -> 'a -> Category.t
  end
