signature CHRONIC =
  sig
    structure Functor : FUNCTOR
    structure Fix     : FIXPOINT
    structure Cofree  : COFREE
   
    val histo : ('a Cofree.t Functor.t -> 'a) -> Fix.t -> 'a
  end

functor Chronic(structure Functor : FUNCTOR) : CHRONIC =
  struct
    structure Functor = Functor
    structure Fix = Fixpoint(structure Functor = Functor)
    structure Cofree = Cofree(structure Functor = Functor)
    open Fix 

    
    fun histo cv x = 
      let
        fun a c = let val (x, _) = C.project c in x end 
        fun f x = C.inject (cv (map x), map x)
        and map x = Functor.fmap f (project x)
      in
        C.present (f x) 
      end 
  end
