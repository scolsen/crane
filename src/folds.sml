(* folds functor implementation *)

functor Folds(structure Fixpoint : FIXPOINT) : FOLDS =
  struct
    structure Fixpoint = Fixpoint
    open Fixpoint 
    
    val identity = inject Functor.identity 
    
    fun cata step x = (step o Functor.fmap (cata step) o project) x 
    fun ana step x = (inject o Functor.fmap (ana step) o step) x 
    fun hylo alg coal x = (alg o Functor.fmap (hylo alg coal) o coal) x 
    fun para alg x = 
      let
        fun f y = (y, (para alg y)) 
      in
        (alg o Functor.fmap f o project) x
      end
    fun apo coal x = 
    let 
      fun f (Left y)  = y 
        | f (Right y) = apo coal y 
    in
      (inject o Functor.fmap f o coal) x 
    end
  end
