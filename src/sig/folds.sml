(* Folds signature *)

signature FOLDS =
  sig
    structure Fixpoint : FIXPOINT
    val identity : Fixpoint.t
    val cata : ('a Fixpoint.Functor.F -> 'a) -> Fixpoint.t -> 'a
    val ana : ('a -> 'a Fixpoint.Functor.F) -> 'a -> Fixpoint.t
    val hylo : ('a Fixpoint.Functor.F -> 'a) -> ('b -> 'b Fixpoint.Functor.F)
    -> 'b -> 'a
    val para : ((Fixpoint.t * 'a) Fixpoint.Functor.F -> 'a) -> Fixpoint.t -> 'a
    val apo  : ('a -> ((Fixpoint.t, 'a) either) Fixpoint.Functor.F) -> 'a -> Fixpoint.t
  end
