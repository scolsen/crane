(* Functor signature *)

signature FUNCTOR =
  sig
    type 'a f
    
    val fmap : ('a -> 'b) -> 'a f -> 'b f
  end

