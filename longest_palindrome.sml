fun removeSpace("") = ""
   |removeSpace(x) = (
    let
        fun helper([], removed_str ) = removed_str
           |helper(a::b, removed_str) =
                if Char.isSpace(a) = false then helper(b, removed_str^Char.toString(a))
                else helper(b, removed_str)
    in helper(explode(x), "")
    end
   )

fun reverseCheck("") = false
   |reverseCheck(x) = if explode(x) = rev(explode(x)) then true
                      else false

fun palindromeFinder("") = "no string detected"
   |palindromeFinder(x) = (
   let val x = removeSpace(x)
     fun helper (c, c_holder, move_one) = (
        if c = size x - 1 then "no palindrome found"

        else if c > 0 then
            let
                val new_str = substring(x, 0 + move_one, size x - c_holder)
            in if reverseCheck(new_str) = true then new_str
               else helper(c - 1, c_holder, move_one + 1) end
        else
            if reverseCheck(x) = true then x
            else let val move_one = 0 and c = c_holder
                    in helper( c + 1, c_holder + 1, move_one) end

      )
    in ( helper (0,0,0) ) end
  )

(*test case *)
val k = "my mom race car pretty nicely"

val _ = print("\nlongest palindrome found in the sentence: \n\n")
val _ = print(palindromeFinder(k) ^ "\n\n")
