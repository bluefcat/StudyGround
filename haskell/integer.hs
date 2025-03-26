sumsq :: Int -> Int
sumsq x = sum [n^2 | n <- [1..x]]

fact :: Int -> Int
fact 0 = 1
fact x = x * fact (x-1)

comb :: Int -> Int -> Int
comb n m
 | (n >= m) = (fact n) `div` (fact m) * (fact (n-m))
 | otherwise = error "n < m!" 

mygcd :: Int -> Int -> Int
mygcd x y
 | (x == 0 || y == 0) = error "0 0"
 | x `mod` y == 0 = y
 | otherwise = mygcd y (mod x y)

checkone :: (Num a) => a -> a -> Bool
checkone x y = (mygcd (x :: Int) (y :: Int)) == 1

isPrime :: (Num a) => a -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime x = all (checkone x) [y | y <- [1..(round (sqrt x))]]

