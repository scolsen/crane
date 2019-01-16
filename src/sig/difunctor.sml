signature DIFUNCTOR =
  sig
    type 'a 'c F

    val dmap : ('b -> 'a) -> ('c -> 'd) -> 'a 'c F -> 'b 'd F
  end
