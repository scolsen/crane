(* fixpoint signature *)

signature FIXPOINT =
  sig
    structure Functor : FUNCTOR
    type t
    
    val identity : 'a Functor.t
    val inject   : t Functor.t -> t  
    val project  : t -> t Functor.t 
  end

functor Fixpoint(structure Functor : FUNCTOR) : FIXPOINT =
  struct
    structure Functor = Functor 
    
    datatype t = Fix of t Functor.t
    val identity = Functor.identity 

    fun inject x = Fix x
    fun project (Fix x) = x
  end
