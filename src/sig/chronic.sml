signature CHRONIC =
  sig
    structure Fix : FIXPOINT
    structure C   : COFREE  
    
    val histo : ('a C.t Fix.Functor.F -> 'a) -> Fix.t -> 'a
  end
