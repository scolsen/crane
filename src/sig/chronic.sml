signature CHRONIC =
  sig
    structure Fixpoint : FIXPOINT
  
    type f 
    type 'a c
    type t

    val histo : (('a * ('a f c)) f -> 'a) -> t -> 'a
  end

functor Chronic(structure Fixpoint : FIXPOINT) : CHRONIC =
  struct
    structure Fixpoint = Fixpoint
    structure Cofree = Cofree(structure Functor = Fixpoint.Functor)
    open Fixpoint 
    
    type f = Fixpoint.Functor.F
    type 'a c = 'a Cofree.t
    type t = Fixpoint.t

    fun histo h x = 
      let
        fun f x = Cofree.inject x
      in
        Functor.fmap f (project x) 
      end
  end
