signature CONTRA =
  sig
    type 'a F

    val fmap : ('b -> 'a) -> 'a F -> 'b F 
  end
