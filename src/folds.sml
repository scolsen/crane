(* Folds signature *)

signature FOLDS = 
  sig
    structure Functor : FUNCTOR
    
    type fix
    type 'a cofree
    type 'a free
    type ('a, 'b) product
    type ('a, 'b) coproduct

    (* Iterative *)
    val cata : ('a f -> 'a) -> fix -> 'a
    val ana  : ('a -> 'a f) -> 'a -> fix
    val hylo : ('a f -> 'a) -> ('b -> 'b f) -> 'b -> 'a
    val meta : ('b -> 'b f) -> ('a f -> 'a) -> fix -> fix

    (* Primitive *)
    val para : ((fix, 'a) product f -> 'a) -> fix -> 'a
    val apo  : ('a -> (fix, 'a) coproduct f) -> 'a -> fix

    (* Chronic *)
    val histo : ('a cofree f -> 'a) -> fix -> 'a
  end 

functor FOLDS(structure Functor : FUNCTOR) : FOLDS =
  struct
    structure Functor = Functor
    structure Fix     = Fixpoint(structure Functor = Functor)
    structure Free    = Free(structure Functor = Functor)
    structure Cofree  = Cofree(structure Functor = Functor)
   
    type fix = Fix.t
    type 'a cofree = 

    (* Iterative *) 
    fun cata al x    = (al o Functor.fmap (cata al) o project) x 
    fun ana co x     = (inject o Functor.fmap (ana co) o co) x 
    fun hylo al co x = (al o Functor.fmap (hylo al co) o co) x    
    fun meta co al x = (ana co o cata al) x

    (* Primitive *)
    fun para al x = (al o Functor.fmap (&o (para al)) o project) x
    fun apo co x  = (inject o Functor.fmap (|o (apo co)) o co) x

    (* Chronic *)
    fun histo al x = id 
  end
