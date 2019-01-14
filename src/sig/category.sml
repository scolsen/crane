(* "category" signature *)

signature CAT =
  sig
    structure Functor : FUNCTOR
    val identity : 'a Functor.F
    val inject   : Functor.fix Functor.F -> Functor.fix  
    val project  : Functor.fix -> Functor.fix Functor.F 
  end
