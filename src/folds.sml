(* folds functor implementation *)

functor Folds(structure Category : CAT) : FOLDS =
  struct
    structure Category = Category
    open Category 
    
    val identity = Category.inject Functor.identity 
    
    fun cata step x   = step (Functor.fmap (cata step) (project x)) 
    fun ana step x    = inject (Functor.fmap (ana step) (step x))
    fun hylo alg coal x = alg (Functor.fmap (hylo alg coal) (coal x)) 
    fun para alg x = alg (Functor.fmap (fn y => (y, (para alg y))) (project x))
    fun apo coal x = 
    let 
      fun f (Left y)  = y 
        | f (Right y) = apo coal y 
    in
      inject (Functor.fmap f (coal x)) 
    end
  end
