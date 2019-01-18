functor Free(structure Functor : FUNCTOR) : FREE =
  struct
    structure Functor = Functor

    datatype 'a free = Free of ('a, (('a Functor.F) free) Functor.F) either
  end
