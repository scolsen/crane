(* folds functor implementation *)

functor Folds(structure Category : CAT) : FOLDS =
  struct
    structure Category = Category
    open Category 
    
    val identity = Category.inject Functor.identity 
    
    fun wrap f g h x = f (Category.Functor.fmap h (g x))
    
    fun cata step x   = wrap step project (cata step) x
    fun ana step x = wrap inject step (ana step) x
    fun hylo alg coal x = cata alg (ana coal x) 
  end
