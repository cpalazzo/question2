# question2

Write a method that answers the following problem:

Accept as input:

list - an unordered list of arrays each with 4 elements.
target - an integer

Find and display the complete array that contains the provided target number. 

------------------------------------------------------------------------------------

I assumed some additional requirements while coding this. They are as follows:

1.  The method prints the found array and returns it as well.
2.  If the target integer is not found, nil is returned and nothing is printed.
3.  If the target integer is present in more than one array, only one array is printed and returned.
4.  If the input list is nil or not a list, an error is raised.
5.  If the input integer is not an integer, an error is raised.
6.  If the list contains an element that is not an array of size 4, an error is raised, regardless of whether the target int is present.
