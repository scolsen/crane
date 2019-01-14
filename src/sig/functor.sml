(* Functor signature *)

signature FUNCTOR =
  sig
    type 'a F
    datatype fix = Fix of fix F
    val identity : 'a F 
    val fmap     : ('a -> 'b) -> 'a F -> 'b F
  end

