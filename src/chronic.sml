functor Chronic(structure Fixpoint : FIXPOINT) : CHRONIC =
  struct
    structure Fixpoint = Fixpoint
    structure Cofree = Cofree(structure Functor = Fixpoint.Functor)
    
    type f = Fixpoint.Functor.F
    type 'a c = 'a Cofree.t
    type t = Fixpoint.t

    fun histo h x= 
  end
