
import Data.List
main :: IO ()
main = print ""
--------------------------


-- A list of floating point numbers (doubles) that are unsorted.
myFloatList = [645.32, 37.40, 76.30, 5.40, -34.23, 1.11, -34.94, 23.37, 635.46,
  -876.22, 467.73, 62.26]

data Person = Person String Int deriving (Show, Eq)

-- A list of unsorted Persons.
people = [Person "Hal" 20, Person "Susann" 31, Person "Dwight" 19,
  Person "Kassandra" 21, Person "Lawrence" 25, Person "Cindy" 22,
  Person "Cory" 27, Person "Romana" 27, Person "Doretha" 32,
  Person "Danna" 20, Person "Zara" 23, Person "Rosalyn" 26,
  Person "Risa" 24, Person "Benny" 28, Person "Juan" 33,
  Person "Natalie" 25]

name :: Person -> String
name (Person n _) = n

age :: Person -> Int
age (Person _ a) = a

instance Ord Person where
  p <= q = name p <= name q

myCompare :: Person -> Person -> Ordering
myCompare x y
    | age x < age y = GT
    | age x > age y = LT
    | x > y = GT
    | otherwise = LT


--- shortcuts for the 3 sorts for lab2
generic_sort1 = sort myFloatList
generic_sort2 = sort people
generic_sort3 = sortBy myCompare people
