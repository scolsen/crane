signature FREE =
  sig
    structure Functor : FUNCTOR
    type 'a t
  end

functor Free(structure Functor : FUNCTOR) : FREE =
  struct
    structure Functor = Functor

    datatype 'a t = Free of ('a, 'a t Functor.t) coproduct
  end
