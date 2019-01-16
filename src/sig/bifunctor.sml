signature BIFUNCTOR =
  sig
    type ('a, 'c) F

    val bmap   : ('a -> 'b) -> ('c -> 'd) -> ('a 'c) F -> ('b 'd) F
    val first  : ('a -> 'b) -> ('a 'c) F -> ('b 'c) F 
    val second : ('c -> 'd) -> ('a 'c) F -> ('a 'd) F 
  end
