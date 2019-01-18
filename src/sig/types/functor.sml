(* Functor signature *)

signature FUNCTOR =
  sig
    type 'a F
    val identity : 'a F 
    val fmap     : ('a -> 'b) -> 'a F -> 'b F
  end

