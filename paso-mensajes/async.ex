defmodule GeneradorFibonacci do
  def nuevo do
     receive do
       mensaje -> send crear_trabajador, mensaje
     end
     nuevo
  end

  def crear_trabajador do
    spawn fn -> TrabajadorFibonacci.nuevo end
  end
end

defmodule TrabajadorFibonacci do
  def nuevo do
     receive do
       {:generar_fibonacci, n, solicitante} -> send solicitante, {:fibonacci_generado, n, fibonacci(n)}
     end
     nuevo
  end

  def fibonacci(0) do 1 end
  def fibonacci(1) do 1 end
  def fibonacci(n) do 
    fibonacci(n-1) + fibonacci(n-2)
  end
end

defmodule ImpresoraFibonacci do
  def  nueva(generador) do
    receive do
      {:imprimir_fibonacci, n} -> 
        send generador, {:generar_fibonacci, n, self}
      {:fibonacci_generado, n, resultado} -> 
        IO.puts "El fibonacci de #{n} es #{resultado}"
    end
    nueva(generador)
  end
end
 

generador = spawn fn -> GeneradorFibonacci.nuevo end
impresora = spawn fn -> ImpresoraFibonacci.nueva(generador) end

send impresora, {:imprimir_fibonacci, 40}
send impresora, {:imprimir_fibonacci, 34}
send impresora, {:imprimir_fibonacci, 2}
send impresora, {:imprimir_fibonacci, 1}
send impresora, {:imprimir_fibonacci, 12}
send impresora, {:imprimir_fibonacci, 29}
send impresora, {:imprimir_fibonacci, 4}



#Un posible resultado (notar el desorden)
#El fibonacci de 2 es 2
#El fibonacci de 1 es 1
#El fibonacci de 12 es 233
#El fibonacci de 4 es 5
#El fibonacci de 29 es 832040
#El fibonacci de 34 es 9227465
#El fibonacci de 40 es 165580141

