datatype ('a, 'b) product = & of 'a * 'b

infix 0 &
infix 0 o&o fun f o&o g = fn x => (f x) & (g x)

fun o& f = f o&o id  
fun &o f = id o&o f

val #& : ('a, 'b) product -> 'a =
  fn x & _ => x
val &# : ('a, 'b) product -> 'b =
  fn _ & y => y
