module Main (main) where

import System (getArgs)
import Text.Regex (mkRegex, subRegex, splitRegex)
import Char (ord, chr)
import Bits (xor)

main :: IO ()

decrypt key index encrypted decrypted = do
  if null encrypted
     then decrypted
     else decrypt key (index + 1) (tail encrypted)
          (decrypted ++ [chr (xor (read (head encrypted) :: Int) (ord ((!!) key (mod index (length key)))))])

main = do
  [f] <- getArgs
  content <- readFile f
  let encrypted = splitRegex (mkRegex ",") (subRegex (mkRegex "[\n\t ]") content "")
  let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"
  putStr (decrypt key 0 encrypted [])
