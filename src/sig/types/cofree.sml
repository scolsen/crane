signature COFREE =
  sig
    structure Functor : FUNCTOR
    datatype 'a t = Cofree of ('a * ('a Functor.F t)) Functor.F

    val inject  : ('a * ('a Functor.F t)) Functor.F -> 'a t
    val project : 'a t -> ('a * ('a Functor.F t)) Functor.F 
  end
