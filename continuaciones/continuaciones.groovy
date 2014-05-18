 class MyCPSStack {
    def elements = []
 
    static empty(yield) {
     yield(new MyCPSStack())
    }
      
    void push(element, yield) {
      yield(new MyCPSStack(elements: [element] + elements))
    }
      
    void pop(yield) {
      if(elements.empty)
        throw new Exception("Stack Underflow")
      yield([elements.head(), new MyCPSStack(elements: elements.tail())])
    }
 
    def discard(yield) {
       pop({ yield(it[1]) })  
    }
 
     //it significa "el (único) argumento que recibe este bloque de código"
     def peek(yield) {
       pop({ yield(it[0]) })  
     }
 
    String toString() {
     return elements.toString()
    }
  } 
 

 MyCPSStack.empty({  it.push(1, {  it.push(2, {  it.discard({  it.peek({  print it })  })  }) }) })

