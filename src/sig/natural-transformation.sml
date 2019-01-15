signature NTRANSFORMATION =
  sig
    structure F : FUNCTOR
    structure G : FUNCTOR
    
    val idF : F.F
    val idG : G.F
    val transform : 'a F.F -> 'a G.F
  end
