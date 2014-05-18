def productor():
  n = 0
  while True:
    yield n
    n += 1

def consumidor(productor):
  while True:
    println(productor.next())


consumidor(productor())
    
