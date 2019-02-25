(* Datatypes that model recursion. 
 * Recursion can be modeled using datatypes over functors, 
 * The structures in this file do precisely that, and are used to implement the
 * corresponding recursion schemes. *)

signature FIX =
  sig
    structure Functor : FUNCTOR
    type fix
    type 'a f = 'a Functor.f  

    val inject  : fix f -> fix
    val project : fix -> fix f
  end 

functor Fix(Functor : FUNCTOR) : FIX =
  struct
    structure Functor = Functor
    open Functor
    
    datatype fix = Fix of fix f

    fun inject x = Fix x
    
    fun project (Fix x) = x 
  end

signature FREE = 
  sig
    structure Functor : FUNCTOR
    type 'a free
    type 'a f = 'a Functor.f

    val inject  : ('a free) f -> 'a free
    val project : 'a free -> (('a free) f, 'a) coproduct
  end 

functor Free(Functor : FUNCTOR) =
  struct
    structure Functor = Functor
    open Functor

    datatype 'a free = Free of ('a free) f 
                     | Pure of 'a

    fun inject x = Free x
    
    fun project (Free x) = Left x
      | project (Pure x) = Right x 
  end

signature COFREE =
  sig
    structure Functor : FUNCTOR
    type 'a cofree
    type 'a f = 'a Functor.f

    val inject  : ('a cofree) f -> 'a cofree
    val project : 'a cofree -> ('a * ('a cofree) f)   
    val first   : 'a cofree -> 'a
    val second  : 'a cofree -> ('a cofree) f 
  end 

functor Cofree(Functor : FUNCTOR) =
  struct
    structure Functor = Functor
    open Functor

    datatype 'a cofree = Cofree of 'a * ('a cofree) f
    
    fun inject x  = Cofree x  
    fun project (Cofree x) = x 

    fun first (Cofree (x, _)) = x 
    fun second (Cofree (_, y)) = y
  end
