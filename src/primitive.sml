signature PRIMITIVE =
  sig
    structure Functor : FUNCTOR
    structure Fix     : FIXPOINT

    val para : ((Fix.t, 'a) product Functor.t -> 'a) -> Fix.t -> 'a
    val apo  : ('a -> (Fix.t, 'a) either Functor.t) -> 'a -> Fix.t
  end

functor Primitive(structure Functor : FUNCTOR) : PRIMITIVE =
  struct
    structure Functor = Functor
    structure Fix = Fixpoint(structure Functor = Functor)

    fun para al x = (al o Functor.fmap (&o (para al)) o project) x
    fun apo co x  = (inject o Functor.fmap (|o (apo co)) o co) x
  end
