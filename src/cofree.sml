
functor Cofree(structure Functor : FUNCTOR) : CAT =
  struct
    structure Functor = Functor
    open Functor

    datatype ('a, 'b) H = History of ('a * 'b Functor.F)  

    datatype t = Fix of (t, t Functor.F) H
    val inject x = 
    val project (Fix x) = 
  end
