import Data.List.Split (splitOn)


firstIndex :: String -> Char -> Int
firstIndex str c = do
  let (x:xs) = str
  if x == c then 0 else 1 + firstIndex xs c

lastIndexAux :: String -> Char -> Int -> Int
lastIndexAux str char index
  | index < 0 = -1
  | str !! index == char = index
  | otherwise = lastIndexAux str char (index - 1)

lastIndex :: String -> Char -> Int
lastIndex str c = lastIndexAux str c (length str - 1)

isUnique :: String -> Char -> Bool
isUnique str c = firstIndex str c == lastIndex str c

reduceToUnique :: String -> String
reduceToUnique str = [x | x <- str, isUnique str x]

getPathAndChecksum :: String -> (String, String)
getPathAndChecksum filename = (path, checksum)
  where
    [path, checksum] = splitOn "-" filename

isRealFile :: String -> Bool
isRealFile filename = checksum == reduceToUnique path
  where
    (path, checksum) = getPathAndChecksum filename

main :: IO()
main = do
  let filename = "./04/in"
  contents <- readFile filename
  let lines = init (splitOn "\n" contents)
  let realFiles = filter isRealFile lines
  print "Real File #33 checksum:"
  print $ snd (getPathAndChecksum (realFiles !! 32))
