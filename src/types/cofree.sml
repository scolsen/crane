functor Cofree(structure Functor : FUNCTOR) : COFREE =
  struct
    structure Functor = Functor
    open Functor
 
    datatype 'a t = Cofree of ('a * 'a t F)
   
    fun inject (x, y)       = Cofree (x, y)
    fun project (Cofree xs) = xs
    fun past x = let val (_, y) = project x in y end
    fun present x = let val (x', _) = project x in x' end
  end
