signature COFREE =
  sig
    structure Functor : FUNCTOR
    type 'a t 

    val inject  : 'a * 'a t Functor.F -> 'a t
    val project : 'a t -> 'a * 'a t Functor.F
    val past    : 'a t -> 'a t Functor.F
    val present : 'a t -> 'a
  end
