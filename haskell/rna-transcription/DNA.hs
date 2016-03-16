module DNA (toRNA) where

toRNA :: String -> String
toRNA = map fromDNA

fromDNA :: Char -> Char
fromDNA 'C' = 'G'
fromDNA 'G' = 'C'
fromDNA 'A' = 'U'
fromDNA 'T' = 'A'
fromDNA  _  = error "Shouldn't be reached"
