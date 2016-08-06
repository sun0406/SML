

fun stringRotation( s1, s2) =
	let val (s1_length, s2_length) = (size s1, size s2)
		and s1s1 = s1^s1
	in if s1_length = s2_length then
		  if String.isSubstring s2 s1s1 = true then true
		  else false
	   else false
	end


val _ = if stringRotation("waterbottle", "erbottlewat") = true then print("true\n")
	    else print("false\n")
val _ = if stringRotation("wwatrbottle", "erbotlewwat") = true then print("true\n")
		else print("false\n")
