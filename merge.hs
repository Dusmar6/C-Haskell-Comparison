
merge_Sort :: Ord int => [int] -> [int]

merge_Sort [] = []
merge_Sort [x] = [x]
merge_Sort xs = merge (merge_Sort a) (merge_Sort b)
  where
    a = take (div (length xs) 2) xs
    b = drop (div (length xs) 2) xs


merge :: Ord int => [int] -> [int] -> [int]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x <= y = x:merge xs (y:ys)
  | x > y =  y:merge (x:xs) ys
