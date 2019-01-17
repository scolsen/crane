(* folds functor implementation *)

functor Folds(structure Fixpoint : FIXPOINT) : FOLDS =
  struct
    structure Fixpoint = Fixpoint
    open Fixpoint 
    
    val identity = inject Functor.identity 
    
    fun cata step x   = step (Functor.fmap (cata step) (project x)) 
    fun ana step x    = inject (Functor.fmap (ana step) (step x))
    fun hylo alg coal x = alg (Functor.fmap (hylo alg coal) (coal x)) 
    fun para alg x = 
      let
        fun f y = (y, (para alg y)) 
      in
        alg (Functor.fmap f (project x))
      end
    fun apo coal x = 
    let 
      fun f (Left y)  = y 
        | f (Right y) = apo coal y 
    in
      inject (Functor.fmap f (coal x)) 
    end
  end
