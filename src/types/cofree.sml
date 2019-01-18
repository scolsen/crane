functor Cofree(structure Functor : FUNCTOR) : COFREE =
  struct
    structure Functor = Functor
    open Functor
 
    datatype 'a t = Cofree of ('a * ('a F t)) F
    
    fun inject x = Cofree x
    fun project (Cofree x) = x
  end
