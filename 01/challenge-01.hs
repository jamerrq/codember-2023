import Data.Map (Map)
import Data.List (intercalate)


countAnimals :: String -> String
countAnimals s = do
    let as = words s
    let animalMap = foldl (\acc x -> if x `elem` acc then acc else x:acc) [] as
    let animalCount = map (\x -> (x, length $ filter (==x) as)) animalMap
    let animalCountStr = map (\(x,y) -> x ++ show y) (reverse animalCount)
    intercalate "" animalCountStr


main :: IO()
main = do
  let filename = "./01/in"
  contents <- readFile filename
  let result = countAnimals contents
  putStrLn result