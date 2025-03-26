quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [a | a <- xs, a <= x] ++ [x] ++ quicksort [a | a <- xs, a > x] 

split_half' :: [a] -> ([a], [a])
split_half' [] = ([], [])
split_half' xs = (take half xs, drop half xs)
  where half = div (length xs) 2

combine :: (Ord a) => [a] -> [a] -> [a]
combine [] [] = []
combine lxs [] = lxs
combine [] rxs = rxs

combine l@(lx:lxs) r@(rx:rxs)
  | lx <= rx = lx:combine lxs r
  | otherwise = rx:combine l rxs 

mergesort :: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]

mergesort xs = combine (mergesort lxs) (mergesort rxs)
  where (lxs, rxs) = split_half' xs


maxi :: (Ord a) => [a] -> a
maxi [] = error "maximum of empty is not defined"
maxi [x] = x
maxi (x:xs)
  | x > maxt = x
  | otherwise = maxt
  where maxt = maxi xs

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:take' (n-1) xs
