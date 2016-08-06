
fun Compression(input) = (
let val input = explode(input); val compressed = ""; val counter = 1
	fun helper( x::y::xs, compressed, counter ) =   if x = y then helper(y::xs, compressed, counter+1)
												     else helper(y::xs, compressed^implode([x])^Int.toString(counter), 1)
	   |helper( x::xs, compressed, counter ) = compressed^implode([x])^Int.toString(counter)
	   |helper( [], compressed, counter ) = compressed	
in
  helper(input, compressed, counter)
end

)


(*test cases *)
val _ = print( "\n\n\n" ^ Compression("aaabbbccccc")^"\n" )
val _ = print(Compression("xxxxzzzzeeqqqhhhq") ^"\n")
val _ = print(Compression("lmnop")^"\n")
val _ = print(Compression("ttteeeeqqqqqddddd")^"\n")
val _ = print(Compression("llllllddddddwwwwwww")  ^ "\n\n\n"  )

