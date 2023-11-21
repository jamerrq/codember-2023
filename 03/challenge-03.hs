import Data.List.Split


splitPassword :: String -> (Int, Int, Char, String)
splitPassword "" = (0, 0, ' ', "")
splitPassword s = do
    let parts = splitOn " " s
    let range = splitOn "-" (head parts)
    let min = read (head range) :: Int
    let max = read (range !! 1) :: Int
    let char = head (parts !! 1)
    let password = parts !! 2
    (min, max, char, password)

checkValidity :: (Int, Int, Char, String) -> Bool
checkValidity (min, max, char, password) = do
    let count = length $ filter (==char) password
    count >= min && count <= max

fourth :: (a, b, c, d) -> d
fourth (_, _, _, d) = d

main :: IO()
main = do
  let filename = "./03/in"
  contents <- readFile filename
  let lines = splitOn "\n" contents
  let passwords = map splitPassword lines
  let invalidPasswords = filter (not . checkValidity) passwords
  print "Invalid password #42:"
  print (fourth (invalidPasswords !! 41))
