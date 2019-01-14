(* folds functor implementation *)

functor Folds(structure Functor : FUNCTOR) : FOLDS =
  struct
    structure Functor = Functor
    structure Cat = Cat(structure Functor = Functor)
    open Cat Functor
    
    val identity = Fix Functor.identity 
    
    fun wrap f g h x = f (fmap h (g x))
    fun fold step x   = wrap step project (fold step) x
    fun unfold step x = wrap inject step (unfold step) x
  end
