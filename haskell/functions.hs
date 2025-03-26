applyTwice :: (a->a)->a->a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a->b->c) -> (b->a->c)
flip' f = g
 where g x y = f y x
-- flip' f y x = f x y
--
map' :: (a->b)->[a]->[b]
map' _ [] = []
map' f (x:xs) = f x: map' f xs
-- map' f xs = [f x | x <- xs]

filter' :: (a->Bool)->[a]->[a]
filter' _ [] = []
filter' f (x:xs)
 | f x = x : filter' f xs
 | otherwise = filter' f xs
-- filter f xs = [x | x <- xs, f x]
-- \args -> functions : lambda function

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\result x -> result + x) 0 xs
-- sum' = foldl (+) 0

combinel :: [Char] -> String
combinel xs = foldl (\result x -> x:result) [] xs
-- combinel [A, B, C] = CBA

combiner :: [Char] -> String
combiner xs = foldr (\x result -> x:result) [] xs
-- combiner [A, B, C] = ABC

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc) 

-- map ($ 3) [(4+), (10*), (^2)] = (7, 30, 9)

makeNegative xs = map (negate . abs) xs
-- f. g. h ((+3) . (*5)) 2 = 13

binarySearch :: (Ord a) => a->[a] ->Int
binarySearch x xs
  | xs !! idx > x = binarySearch x (take idx xs)
  | xs !! idx < x = binarySearch x (drop idx xs) + idx
  | xs !! idx == x = idx
  where idx = (length xs) `div` 2

