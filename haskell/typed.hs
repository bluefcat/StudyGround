ru :: [Char] -> [Char]
ru x = [ c | c <- x, c `elem` ['A'..'Z']]

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY"
lucky x = "NO"


fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib 2 = 1
fib x = fib(x-1) + fib(x-2)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

len :: (Num b) => [a] -> b
len [] = 0
len (_:xs) = 1 + len xs

test_arr = [c | c <- [1..100]] :: [Int]

f :: [Int] -> String
f a@(x:xs) = "The " ++ show(a) ++ "'s first element is " ++ show(x)
