

fun URLify(input) = (
let
	val str = ""; val input = explode(input)
	fun helper(input, str) = (
		case input of
			x::y::xs => (if Char.isSpace(x) = false then helper(y::xs, str^implode([x]))
						 	else 
								if Char.isSpace(y) = false then helper(xs, str^"%20"^implode([y]))
								else helper(y::xs, str)  )
			|x::xs =>   (if Char.isSpace(x) = false then str^implode([x]) else str)
			|[] => str

	)
in
  helper(input,str)
end)




(*test cases*)
val str1 = "Mr john Smith    "
val str2 = "aaaa  bbb cccc    dd  ee"
val str3 = "rrrrr eeeeeeee         e"
val str4 = "rrrrr eeeeeeee         e "
val str5 = "rrrrr eeeeeeee         e f"

val _ = print("\n\n" ^ URLify(str1) ^ "\n")
val _ = print(URLify(str2) ^ "\n")
val _ = print(URLify(str3) ^ "\n")
val _ = print(URLify(str4) ^ "\n")
val _ = print(URLify(str5) ^ "\n\n")




