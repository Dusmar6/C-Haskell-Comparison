
-- Type declaration for the function merge_Sort which takes a list of integers
-- and sorts them smallest to largest.
merge_Sort :: Ord int => [int] -> [int]

-- If an empty list is given an empty list is returned.
merge_Sort [] = []

-- If a list with a single element is given it is returned.
merge_Sort [x] = [x]

-- Otherwise call the helper function merge passing it a recursive call to
-- merge_Sort with both the first and second half of xs.
merge_Sort xs = merge (merge_Sort a) (merge_Sort b)
  where
    a = take (div (length xs) 2) xs -- a is defined as the first half of xs.
    b = drop (div (length xs) 2) xs -- b is defined as the second half of xs.


-- Type declaration for the function merge_Sort which takes two lists of
-- integers and outputs a sorted list of integers by combining the elements of
-- the two unordered input lists together into one ordered list.
merge :: Ord int => [int] -> [int] -> [int]

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
