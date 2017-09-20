import Data.List

----------
-- 1ERO --
----------

--TO TEST (IN TIME) WORK WITH THE EXAMPLE
-- round1 = [i | j <- [2..10], i <- [21..10000], mod i j /= 0]
-- round2 = [[21..10000] \\ round1]
-- OUT = 2520

round1 = [i | j <- [2..20], i <- [21..], mod i j /= 0]
--Set substraction #magic
round2 = [[21..] \\ round1]

---------
-- 2DO --
---------

isPrime k = null [ x | x <- [2..k - 1], k `mod`x  == 0]
ft1 (val) (count)
      | count == 10001 = val
      | isPrime val = ft1 (val + 1) (count + 1)
      | otherwise = ft1 (val + 1) (count)


----------
-- 3ERO --
----------

isPal num = if show num == reverse (show num)
            then True
            else False

dostuffhere = [i * j | j <- [100..999], i <- [100..999], isPal (i * j) == True]

largest :: [Int] -> Int
largest [] = 0
largest (head : tail) = max head (largest tail)
largestPal = largest dostuffhere


---------
-- 4TO --
---------

data Tree x = EmptyTree
            | Node x (Tree x) (Tree x) deriving(Show)

insertt x EmptyTree = Node x EmptyTree EmptyTree
insertt x (Node z left right)
        | x==z = Node z left right
        | x <z = Node z (insertt x left) right
        | otherwise = Node z left (insertt x right)

toTree (f:l) = ft f l EmptyTree
         where ft (val) (h:t) (currentTree)
                | t == []   = insertt h (insertt val currentTree)
                | otherwise = ft h t (insertt val currentTree)

-- THANKS TO GROUP COUNCIL --
treeToList EmptyTree = []
treeToList (Node n lf rt) = treeToList lf ++ [n] ++ treeToList rt
