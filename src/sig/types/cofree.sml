signature COFREE =
  sig
    structure Functor : FUNCTOR
    type 'a t 

    val inject  : 'a * 'a t Functor.F -> 'a t
    val project : 'a t -> 'a * 'a t Functor.F
  end
