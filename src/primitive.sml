signature PRIMITIVE =
  sig
    structure Functor : FUNCTOR
    structure Fix     : FIX
    sharing type 'a Fix.f = 'a Functor.f
    type 'a f = 'a Fix.f
    type fix = Fix.fix

    val para : ((fix, 'a) f -> 'a) -> fix -> 'a
    val apo  : ('a -> ((fix, 'a) coproduct) f) -> 'a -> fix
  end

functor Primitive(Functor : FUNCTOR) : PRIMITIVE =
  struct
    structure Functor = Functor
    structure Fix = Fix(Functor)
    open Functor Fix

    fun para (f:) (x:fix)

    fun para f x = (al o Functor.fmap (&o (para al)) o project) x
    
    fun apo co x  = (inject o Functor.fmap (|o (apo co)) o co) x
  end
