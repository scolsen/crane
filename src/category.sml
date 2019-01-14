(* Category functor implementation *)

functor Cat(structure Functor : FUNCTOR) : CAT =
  struct
    structure Functor = Functor
    open Functor
    val identity = Functor.identity
    
    fun inject x = Fix x
    fun project (Fix x) = x
  end
