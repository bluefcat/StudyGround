isPrime :: Int -> Bool
isPrime x
 | x <= 1 = False
 | x == 2 = True
 | otherwise = all (/= 0) [x `mod` p | p <- [2..(x-1)]]

delete :: Int -> [Int] -> [Int]
delete x xs = filter ((/= 0) . (`mod` x)) xs

getPrime' :: Int -> [Int] -> [Int]
getPrime' _ [] = []
getPrime' p ps = p : getPrime' (head nps) nps 
 where nps = delete p ps

getPrime :: Int -> [Int]
getPrime x
 | x <= 1 = []
 | x == 2 = [2]
 | otherwise = getPrime' 2 [3..x]

