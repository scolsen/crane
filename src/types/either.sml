datatype ('a, 'b) coproduct = Left of 'a | Right of 'b 

infix 0 o|o fun f o|o g = 
  fn (Left x)  => f x
   | (Right x) => g x

fun o| f = f o|o id 
fun |o f = id o|o f
