(* Functor signature *)

signature FUNCTOR =
  sig
    type 'a t
    val identity : 'a t 
    val fmap     : ('a -> 'b) -> 'a t -> 'b t
  end

