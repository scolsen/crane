functor Cofree(structure Functor : FUNCTOR) : COFREE =
  struct
    structure Functor = Functor
    open Functor
 
    datatype 'a t = Cofree of ('a * 'a t F)
   
    fun inject (x, y)       = Cofree (x, y)
    fun project (Cofree xs) = xs
  end
