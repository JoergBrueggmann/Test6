module Lib
    ( someFunc
    ) where

import qualified System.Random as Rnd

someFunc :: IO ()
someFunc = putStrLn Rnd.sTest -- "dfgh"--
