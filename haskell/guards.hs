scoreletter :: Int -> String
scoreletter score
  | score < 1 = "F"
  | score < 2 = "D"
  | score < 3 = "C"
  | score < 4 = "B"
  | otherwise = "A"

mmax :: (Ord a) => a -> a -> a
mmax a b
  | a > b = a
  | otherwise = b

dt :: (RealFloat a) => a -> a -> String
dt m v
  | d < p = "Hello"
  | d <= q = "World"
  | otherwise = "What"
  where d = m / v 
	(p, q) = (1.2, 1000.0)

cd :: (RealFloat a) => [(a, a)] -> [a]
cd xs = [density m v | (m, v) <- xs]
  where density mass volume = mass/volume

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = do
 let sideArea = 2*pi*r*h
 let topArea = pi*r ^2
 sideArea + 2 * topArea

cc = do
	let a = 3*2
	let	b = 4*2
	a*b
