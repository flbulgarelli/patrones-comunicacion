import Data.Traversable

productor = iterate (+1) 0

consumidor productor = do
  for productor print
  return ()

main = consumidor productor 
