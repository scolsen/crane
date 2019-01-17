(* Fix signature *)

functor Fix(structure Functor : FUNCTOR) : FIXPOINT =
  struct
    structure Functor = Functor 
    open Functor 
    
    datatype t = Fix of t Functor.F
    val identity = Functor.identity 

    fun inject x        = Fix x
    fun project (Fix x) = x
  end
