import Data.Function ((&))
import qualified Data.List as List

main :: IO ()
main =
  [4, 65, 2, -31, 0, 99, 2, 83, 782, 1] & quickSort & show & putStrLn


quickSort :: (Ord a) => [a] -> [a]
quickSort []  = []
quickSort [x] = [x]
quickSort xs  = quickSort lhs <> [pivot] <> quickSort rhs
  where
    (pivot, rest) = pivotFor xs
    (lhs, _, rhs) = partition pivot rest

partition :: (Ord a) => a -> [a] -> ([a], a, [a])
partition pivot xs = (lhs, pivot, rhs)
  where
    (lhs, rhs) = List.partition (< pivot) xs

pivotFor :: [a] -> (a, [a])
pivotFor (x:rest) = (x, rest)