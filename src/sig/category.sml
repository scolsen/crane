(* "category" signature *)

signature CAT =
  sig
    structure Functor : FUNCTOR
    type t
    val identity : 'a Functor.F
    val inject   : t Functor.F -> t  
    val project  : t -> t Functor.F 
  end
