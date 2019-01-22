(* Folds signature *)

signature FOLDS = 
  sig
    structure Functor : FUNCTOR
    type cofree
    type free
    type fix
    type f

    (* Iterative *)
    val cata : ('a f -> 'a) -> fix -> 'a
    val ana  : ('a -> 'a f) -> 'a -> fix
    val hylo : ('a f -> 'a) -> ('b -> 'b f) -> 'b -> 'a
    val meta : ('b -> 'b f) -> ('a f -> 'a) -> fix -> fix

    (* Primitive *)
    val para : ((fix, 'a) product f -> 'a) -> fix -> 'a
    val apo  : ('a -> (fix, 'a) either f) -> 'a -> fix

    (* Chronic *)
    val histo : ('a cofree f -> 'a) -> fix -> 'a
  end 

functor FOLDS(structure Functor : FUNCTOR) : FOLDS =
  struct
    structure Functor = Functor

    (* Iterative *) 
    fun cata al x    = (al o Functor.fmap (cata al) o project) x 
    fun ana co x     = (inject o Functor.fmap (ana co) o co) x 
    fun hylo al co x = (al o Functor.fmap (hylo al co) o co) x    
    fun meta co al x = (ana co o cata al) x

    (* Primitive *)
    fun para al x = (al o Functor.fmap (&o (para al)) o project) x
    fun apo co x  = (inject o Functor.fmap (|o (apo co)) o co) x

    (* Chronic *)
  end
