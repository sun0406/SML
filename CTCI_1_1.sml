
fun contains(l, []) = false
   |contains(l, x::xs) = if l = x then true else contains(l, xs)
fun isUnique([], list1)  = true
    |isUnique(x::xs, list1) = if contains(x, list1) = true then false
							     else isUnique(xs, x::list1)

fun Unique(input) = ( let val input = explode(input); val holder = []
					  in 	  isUnique(input, holder) end)


(* test cases *)
val holder = []

val str1 = "abcdefghijk12345[]"
val str2 = "aabcdefga"
val str3 = "mnbvcxz"
val str4 = "zmnbvcxz"

val _ = if Unique(str1) = true then print("true\n") else print("false\n")
val _ = if Unique(str2) = true then print("true\n") else print("false\n")
val _ = if Unique(str3) = true then print("true\n") else print("false\n")
val _ = if Unique(str4) = true then print("true\n") else print("false\n")





