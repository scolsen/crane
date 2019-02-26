(* Iterative morphisms/folds. *)

signature ITERATIVE =
  sig
    structure Functor : FUNCTOR
    structure Fix : FIX
    sharing type 'a Functor.f = 'a Fix.f
    type 'a f = a' Fix.f 
    type fix = Fix.fix

    cata : ('a f -> 'a) -> fix -> 'a
    ana  : ('a -> 'a f) -> 'a -> fix
    
    hylo : ('a f -> 'a) -> ('b -> 'b f) -> 'b -> 'a
    meta : ('b -> 'b f) -> ('a f -> 'a) -> fix -> fix
  end

functor Iterative(Functor : FUNCTOR) : ITERATIVE =
  struct
    structure Functor = Functor
    structure Fix = Fix(Functor)
    open Functor Fix

    fun cata (f:'a f -> 'a) (x:fix) 
      : 'a
      = f (fmap (cata f) (project x))
    
    fun ana (f:'a -> 'a f) (x:'a)
      : fix
      = inject (fmap (ana f) (f x))

    fun hylo (f:'a f -> 'a) (g:'b -> 'b f) (x:'b) 
      : 'a
      = f (fmap (hylo f g) (g x))

    fun meta (f: 'b -> 'b f) (g:'a f -> 'a) (x:fix)
      : fix
      = ana f (cata g x)
  end
