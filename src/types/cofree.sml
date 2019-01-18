functor Cofree(structure Functor : FUNCTOR) : COFREE =
  struct
    structure Functor = Functor
    open Functor
 
    datatype 'a t = Cofree of ('a * ('a F t)) F
   
    fun inject f x = Cofree (x, fmap f x) 
    fun project (Cofree x) = x
  end
