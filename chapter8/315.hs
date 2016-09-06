module Page315 where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny

appedCatty = cattyConny "woops"
frappe = flippy "haha"

main :: IO ()
main = do
  print (appedCatty "woohoo!" == "woops mrow woohoo!")
  print (frappe "1" == "1 mrow haha")
  print (frappe (appedCatty "2") == "woops mrow 2 mrow haha")
  print (appedCatty (frappe "blue") == "woops mrow blue mrow haha")
  print (cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue")) == "pink mrow haha mrow green mrow woops mrow blue")
  print (cattyConny (flippy "Pugs" "are") "awesome" == "are mrow Pugs mrow awesome")

summer :: (Eq a, Num a) => a -> a
summer x = loop x 1 0
  where
    loop x c acc
      | c == x = acc + x
      | otherwise = loop x (c + 1) (acc + c)

times :: (Integral a) => a -> a -> a
times x y = loop x y 0
  where
    loop x y acc
      | y == 0 = acc
      | otherwise = loop x (y-1) (acc+x)
