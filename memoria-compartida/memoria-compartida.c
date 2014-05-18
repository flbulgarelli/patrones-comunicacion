 #include <stdio.h>
 #define SIZE 50
 
 int  current, stack[SIZE];
 
 void init() {
   current = 0; /* initialize current */
 }
 
 void push(int i) {
   current++;
   if(current == (SIZE)) {
     printf("Stack Overflow.\n");
     exit(1);
   }
   stack[current] = i;
 }
 
 int pop(void) {
   if(current == 0) {
     printf("Stack Underflow.\n");
     exit(1);
   }
   current--;
   return stack[current+1];
 }
 
 int main(void) {
   int value;
   init();
   
   push(1);
   push(2);
   printf("First value on top is %d\n", pop());
   printf("Second value on top is %d\n", pop());
   printf("Third value on top is %d\n", pop());
   printf("end\n");
   	
   return 0;
 }
