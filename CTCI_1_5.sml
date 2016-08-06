
fun max_min (str1, str2) = (
if length(str1) > length(str2) then (str1, str2)
else (str2, str1)  )


fun compare(str1, str2) = (
let val (str1, str2) = max_min(str1, str2)
  val (str1_len, str2_len) = (length(str1), length(str2))
  fun helper (x::xs, y::ys) = ( if x<>y then
								    if str1_len = str2_len then (implode(xs), implode(ys))
									else (implode(xs), implode([y])^implode(ys)) 
								else helper(xs, ys)	)
      |helper([], []) = (implode(str1), implode(str2))
	  |helper([], y::ys) = ("","") (*off by one in the end e.g.-{pale, pales}, should be true*)
	  |helper(x::xs, []) = ("","") (*same here*)
in helper(str1, str2) 
end )


fun OneAway (input1, input2) = (
let
  val (str1, str2) = ( explode(input1), explode(input2) )
  val (str1_len, str2_len) = (length str1, length str2)
  fun helper(str1, str2) = if (str1_len - str2_len) > 1 orelse (str1_len - str2_len) < ~1 then false
						   else let  
						      val (new_str1, new_str2) = compare(str1, str2)
							  in new_str1 = new_str2 end

in helper(str1, str2)
end

)

(*test cases*)
val _ = if OneAway("plfea", "ple") = true then print("\n\ntrue\n") else print("\n\nfalse\n")
val _ = if OneAway("pale", "ple") = true then print("true\n") else print("false\n")
val _ = if OneAway("ple", "pale") = true then print("true\n") else print("false\n")
val _ = if OneAway("pales", "pale") = true then print("true\n") else print("false\n")
val _ = if OneAway("pale", "bale") = true then print("true\n") else print("false\n")
val _ = if OneAway("pale", "bake") = true then print("true\n\n") else print("false\n\n")









