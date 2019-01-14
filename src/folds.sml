(* folds functor implementation *)

functor Folds(structure Category : CAT) : FOLDS =
  struct
    structure Category = Category
    open Category 
    
    val identity = Category.inject Functor.identity 
    
    fun wrap f g h x = f (Category.Functor.fmap h (g x))
    fun fold step x   = wrap step project (fold step) x
    fun unfold step x = wrap inject step (unfold step) x
  end
