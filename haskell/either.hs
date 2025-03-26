import qualified Data.Map as Map

f ::Int -> Either Int Float
f x
 | x > 0 = Left x
 | x <= 0 = Right pi

data LockerState = Taken | Free deriving(Eq, Show)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = 
  case Map.lookup lockerNumber map of
    Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken 
      then Right code
      else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList [(100, (Taken, "1")), (101, (Free, "2"))]

infixr 5 :-:
data List' a = Empty | a :-: (List' a) deriving(Show, Read, Ord, Eq)
data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show, Read, Ord, Eq)

getTree x = Node x Leaf Leaf
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x Leaf = getTree x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x Leaf = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right
