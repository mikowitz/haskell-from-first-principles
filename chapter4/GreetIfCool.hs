module GreetIfCool where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool
     then putStrLn "eyyyyyy."
     else
     putStrLn "pshhhh."
       where cool = coolness == "downright frosty yo"
