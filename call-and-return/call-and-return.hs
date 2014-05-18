type Stack = [Int]
 
empty :: Stack
empty = []
 
push :: Int -> Stack -> Stack
push i s = i : s
 
pop :: Stack -> (Int, Stack)
pop [] = error "Stack Underflow.\n"
pop (i:s) = (i, s)
 
discard = snd . pop
peek = fst . pop
 
test1 = peek $ discard $ push 2 $ push 1 $ empty
 
