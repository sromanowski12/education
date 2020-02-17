## **C311 Notes - 2/13/20**

**Ex. 1 The while loop and the GCD**
Ex. 1 The while loop and the GCD
Write a function in Lisp called gcd computing the greatest common divisor (GCD) of two numbers. You can assume that both parameters of this function are positive numbers. Use Euclid's algorithm for this and a while loop.

Euclid's algorithm. Let n and m be the two numbers. Suppose that n>m, otherwise you can call the function again by reversing the order of the parameters (but the function works even without that). Let dividend = n, divisor = m, and remainder be 3 local variables. Then the algorithm will perform the operations:
remainder = dividend % divisor;
dividend = divisor;
divisor = remainder;
until the remainder is equal to 0 (use the predicate =). Then the value of the dividend at that point is the result of the function.

Examples of calls:
(gcd 12 18) ; return 6
(gcd 33 64) ; returns 1
(gcd 100 15) ; returns 5


**Ex. 2 Lambda Expression**


See the function copy2 in copy_list.el for similar example.

Write in Lisp a function that replaces all the occurrences of a value in a list with something else. For example, if the first line in the function is

(defun replace (L z y)
then L should be a list, z the value to be searched for in the list, and y the value to replace it with.
Inside this function, define a lambda expression taking one parameter, let's call it x. In this lambda expression, compare the parameter to the parameter x with z, and if they are equal, return y. Otherwise, return x. Store this lambda expression in a variable.

Next, use mapcar and the variable containing the lambda expression to apply the anonymous function just described to all the elements of the list L. The result should be the same list where x is replaced with y. For example, evaluating

(replace '(3 1 5 6 3 2 3) 3 9)
should result in
(9 1 5 6 9 2 9)
When you compare the two parameters x and z, use the predicate equal instead of =. This will allow the replacement to work for things that are not numbers too.

Write a function in Lisp called print-list taking one parameter which we can assume to be a list. The function should print all the elements of the list using the function princ and a space between them. Use the function mapc for this purpose.
Show a few examples of testing this function. Show one example using the function apply and one using the function funcall.