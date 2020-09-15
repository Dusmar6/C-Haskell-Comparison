
main :: IO ()
main = print $
    msort [4, 65, 2, -31, 0, 99, 2, 83, 782, 1]

-- Type declaration for the function merge_Sort which takes a list of integers
-- and sorts them smallest to largest.
msort :: Ord a => [a] -> [a]

-- If an empty list is given an empty list is returned.
msort [] = []

-- If a list with a single element is given it is returned.
msort [x] = [x]

-- Otherwise call the helper function merge passing it a recursive call to
-- merge_Sort with both the first and second half of xs.
msort xs = merge (msort left) (msort right)
  where
    left = take (div (length xs) 2) xs -- 'left' is defined as the first half of xs.
    right = drop (div (length xs) 2) xs -- 'right' is defined as the second half of xs.


-- Type declaration for the function merge_Sort which takes two lists of
-- integers and outputs a sorted list of integers by combining the elements of
-- the two unordered input lists together into one ordered list.
merge :: Ord a => [a] -> [a] -> [a]

-- if the second argument is an empty list return the first argument.
merge xs [] = xs

-- if the first argument is an empty list return the second argument.
merge [] ys = ys

-- Otherwise check the first element from each argument
-- if the first element is smaller than or equal to the first element in the
-- second argument cons that element with a recursive call to merge that passes
-- the rest of the first argument with all of the second argument.
-- Otherwise do the same thing except with the arguments fliped.
merge (x:xs) (y:ys)
  | x <= y = x:merge xs (y:ys)
  | x > y =  y:merge (x:xs) ys
