main :: IO ()
main = print $
    msort [4, 65, 2, -31, 0, 99, 2, 83, 782, 1]

-- quicksort transforms list of a elements into list of same type
-- a is an instance of typeclass Ord (elements can be compared)
quickSort :: (Ord a) => [a] -> [a]
quickSort []  = [] -- empty list
quickSort [x] = [x] -- A list with a single element is simply returned
-- nonempty list xs where left of pivot is compared to pivotFor
-- 		then compared with right of pivot then concatenated all together
quickSort xs  = quickSort lhs <> [pivot] <> quickSort rhs
  where
	-- sets the pivot, xs (rest) for nonempty list xs using xs as parameter for pivotFor
    (pivot, rest) = pivotFor xs
	-- sets the nonempty lists for left of pivot and right of pivot using pivot, rest as parameters for partition
    (lhs, _, rhs) = partition pivot rest

-- partition transforms a element and list of a elements into ([a], a [a]) of same type
-- a is an instance of typeclass Ord (elements can be compared)
partition :: (Ord a) => a -> [a] -> ([a], a, [a])
-- assigns left of pivot, pivot, right of pivot using parameters pivot and xs (remaining elements)
partition pivot xs = (lhs, pivot, rhs)
  where
	-- sets lhs (left of pivot) to values that satisfy predicate (less than pivot) from elements of xs
	-- sets rhs (right of pivot) to values that do not satisfy predicate from elements of xs
    (lhs, rhs) = List.partition (< pivot) xs

-- pivotFor transforms a list of a elements into (a, [a]) of same type
pivotFor :: [a] -> (a, [a])
-- assigns head element x as pivot and remaining elements as rest
pivotFor (x:rest) = (x, rest)
