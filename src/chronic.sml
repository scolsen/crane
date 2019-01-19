functor Chronic(structure Fix : FIXPOINT) : CHRONIC =
  struct
    structure Fix = Fix
    structure C   = Cofree(structure Functor = Fix.Functor)
    open Fix 

    
    fun histo cv x = 
      let
        fun a c = let val (x, _) = C.project c in x end 
        fun f x = C.inject (cv (map x), map x)
        and map x = Functor.fmap f (project x)
      in
        a (f x) 
      end 
  end
