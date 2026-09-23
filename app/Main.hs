module Main (main) where

-- ============================================================
-- 1. PURE FUNCTIONS
-- A pure function's output depends ONLY on its input arguments.
-- It has no side effects: no printing, no file I/O, no changing
-- external state. Same input -> same output, every single time.
-- ============================================================
square :: Int -> Int
square x = x * x
-- 'square' never touches anything outside itself. Calling square 5
-- a million times will always return 25, with zero side effects.

-- ============================================================
-- 2. IMMUTABILITY
-- In Haskell, once a value is bound to a name, it cannot be
-- changed. "Modifying" data actually creates a brand new value,
-- leaving the original completely untouched.
-- ============================================================
originalList :: [Int]
originalList = [1, 2, 3]

changedList :: [Int]
changedList = 0 : originalList
-- changedList is a NEW list [0,1,2,3]. originalList still equals
-- [1,2,3] afterward — it was never mutated in place, unlike
-- arrays in imperative languages like Python or Java.

-- ============================================================
-- 3. HIGHER-ORDER FUNCTIONS
-- A function that takes another function as an argument, or
-- returns a function as its result.
-- ============================================================
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
-- 'applyTwice' takes a function f as its FIRST argument and
-- applies it twice. This is only possible because functions
-- are treated as ordinary values that can be passed around.

-- ============================================================
-- 4. FIRST-CLASS FUNCTIONS
-- Functions can be treated exactly like any other value: stored
-- in variables, put into lists, passed as arguments, or returned
-- from other functions — with no special restrictions.
-- ============================================================
myFunc :: Int -> Int
myFunc = square
-- Here 'square' itself (not its result) is assigned to 'myFunc',
-- proving a function is just a regular value.

functionList :: [Int -> Int]
functionList = [square, (+1), (*2)]
-- A LIST of functions. This is only possible if functions are
-- first-class values, just like a list of Ints or Strings.

-- ============================================================
-- 5. REFERENTIAL TRANSPARENCY
-- Any expression can be replaced by its evaluated value without
-- changing the meaning or behavior of the program. This follows
-- directly from purity + immutability: since square always
-- returns the same result for the same input, "square 4" and
-- "16" are 100% interchangeable everywhere in the code.
-- ============================================================

main :: IO ()
main = do
  putStrLn "-- Pure Functions --"
  print (square 5)  -- always 25, no matter how many times it's called

  putStrLn "\n-- Immutability --"
  print originalList  -- [1,2,3] — unchanged
  print changedList   -- [0,1,2,3] — a new list, original untouched

  putStrLn "\n-- Higher-order Functions --"
  print (applyTwice square 3)  -- square(square(3)) = 81

  putStrLn "\n-- First-class Functions --"
  print (myFunc 6)                        -- 36
  print (map (\f -> f 10) functionList)   -- [100, 11, 20]

  putStrLn "\n-- Referential Transparency --"
  print (square 4)  -- 16
  print (16 :: Int)          -- same value, proving square 4 can be
                     -- substituted with 16 anywhere safely