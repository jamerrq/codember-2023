auxFunction :: String -> Integer -> String -> String
auxFunction "" _ r = r
auxFunction (x:xs) n r
    | x == '#' = auxFunction xs (n+1) r
    | x == '@' = auxFunction xs (n-1) r
    | x == '*' = auxFunction xs (n*n) r
    | x == '&' = auxFunction xs n (r ++ show n)
    | otherwise = auxFunction xs n r

miniCompiler :: String -> String
miniCompiler s = auxFunction s 0 ""

main :: IO()
main = do
  let filename = "./02/in"
  contents <- readFile filename
  let result = miniCompiler contents
  putStrLn result
