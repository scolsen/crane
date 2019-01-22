signature COFREE =
  sig
    structure Functor : FUNCTOR
    type 'a t 

    val inject  : 'a * 'a t Functor.t -> 'a t
    val project : 'a t -> 'a * 'a t Functor.t
    val past    : 'a t -> 'a t Functor.t
    val present : 'a t -> 'a
  end

functor Cofree(structure Functor : FUNCTOR) : COFREE =
  struct
    structure Functor = Functor
 
    datatype 'a t = Cofree of ('a, 'a t Functor.t) product
   
    fun inject (x, y)       = Cofree (x, y)
    fun project (Cofree xs) = xs
    fun past x = let val (_, y) = project x in y end
    fun present x = let val (x', _) = project x in x' end
  end
