(* Folds signature *)

signature FOLDS =
  sig
    structure Functor : FUNCTOR
    val identity : Functor.fix
    val fold : ('a Functor.F -> 'a) -> Functor.fix -> 'a
    val unfold : ('a -> 'a Functor.F) -> 'a -> Functor.fix
  end
