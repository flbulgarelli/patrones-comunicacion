require 'fiber'

n = 0

productor = Fiber.new do |consumidor|
   while true
    consumidor.transfer
    n += 1
  end
end

consumidor = Fiber.new do
   while true
     puts n
     productor.transfer
   end
end

productor.resume consumidor

