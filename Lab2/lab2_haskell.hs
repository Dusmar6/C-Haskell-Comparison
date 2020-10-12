
import Data.List
main :: IO ()
main = print ""
--------------------------


-- A list of floating point numbers (doubles) that are unsorted.
myFloatList = [645.32, 37.40, 76.30, 5.40, -34.23, 1.11, -34.94, 23.37, 635.46,
  -876.22, 467.73, 62.26]

--Defining a Person data type with a String (name) and an Int (age)
data Person = Person String Int deriving (Show, Eq)

-- A list of unsorted Persons.
people = [Person "Hal" 20, Person "Susann" 31, Person "Dwight" 19,
  Person "Kassandra" 21, Person "Lawrence" 25, Person "Cindy" 22,
  Person "Cory" 27, Person "Romana" 27, Person "Doretha" 32,
  Person "Danna" 20, Person "Zara" 23, Person "Rosalyn" 26,
  Person "Risa" 24, Person "Benny" 28, Person "Juan" 33,
  Person "Natalie" 25]

--Fuction for getting the name of a Person.
name :: Person -> String
name (Person n _) = n -- Ignore the second param and return the first (name)

--Fuction for getting the age of a Person.
age :: Person -> Int
age (Person _ a) = a -- Ignore the First param and return the second (age)

--How order is defined on a Person.
instance Ord Person where
  p <= q = name p <= name q -- Define order of a Person by name (lexicographically)

--Special comparison function for a Person type that orders by age first (decending)
--then name (lexicographically) if the ages are equal.
myCompare :: Person -> Person -> Ordering
myCompare x y
    | age x < age y = GT --fliped LT and GT to get decending order in sort
    | age x > age y = LT
    | x > y = GT  --if age are equal compare by the normal Ord of Person
    | otherwise = LT



--- shortcuts for the 3 sorts for lab2 (sort x == sortBy compare x)
generic_sort1 = sort myFloatList
generic_sort2 = sort people
generic_sort3 = sortBy myCompare people
