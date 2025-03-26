module Shapes(
 Point(..),
 Shape(..),
 surface,
 nudge,
 baseCircle,
 baseRect,
) where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x1-x2) * (abs $ y1-y2)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b =
  Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

--
--

data Person = Person {
  firstName::String,
  lastName::String,
  age :: Int,
  height :: Float,
  phoneNumber :: String,
  flavor :: String
} deriving (Show)

-- let t = Person{firstName = "..." ... }

data Car a b c = Car {
  company:: a,
  model :: b,
  year :: c
} deriving(Show)

tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company=c, model=m, year=y}) = 
  "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
