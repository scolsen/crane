signature FREE =
  sig
    structure Functor : FUNCTOR
    type 'a t

    val inject  : ('a t) Functor.F -> 'a
    val project : 'a -> ('a t) Functor.F 
  end
