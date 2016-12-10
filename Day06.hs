module Main where

import           Common
import           Data.List
import qualified Data.Map as Map
import           Data.Ord

main :: IO ()
main =
  do input <- lines <$> readInputFile 6
     putStrLn (decode id   input)
     putStrLn (decode Down input)

decode :: Ord a => (Int -> a) -> [String] -> String
decode f xs = mostCommon f <$> transpose xs

mostCommon :: (Ord a, Ord b) => (Int -> b) -> [a] -> a
mostCommon f = fst . maximumBy (comparing (f . snd)) . tally

tally :: Ord a => [a] -> [(a,Int)]
tally xs = Map.toList (Map.fromListWith (+) [(x,1) | x <- xs])
