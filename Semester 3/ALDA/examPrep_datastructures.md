# Table of Contents
1. [Introduction of ALDA](#first)
2. [Data Structures: Arrays & Linked lists](#second)
3. [Complexity](#third)
4. [Data Structures: Stacks, Queues & Bags](#fourth)

# 1. ALDA_Introduction <a name="first"> </a>

## Algorithm definition
- used in computer science  to describe a problem-solving method suitable for an implementation as a computer program
- method or program to calculate a (mathematical) problem using a certain computational model
- implements a (mathematical) function
- implements operations to transform data via (pre-) defined operations
- examples:
  - operations on basic data structures, e.g. stacks and queues
  - sorting algorithms with an appropriate data structure
  - searching algorithms
  - graph algorithms: shortest path, search in a network, ...

## Typical operations on data
- creation / initialization
- reading / retrieving
- updating (often achieved by deleting and (re-) creation)
- deleting
- searching
- sorting
- union and intersection of sets
- traversal of certain data structures, like trees and graphs

# 2. DataStructures_1 <a name="second"> </a>

## Abstract Data Type (ADT)

- defines a type (name) and corresponding methods
- does not define a certain data structure
- fundamental concept of object-oriented programming
- like a java interface, but extended with constructor(s)
- is an API for one type

## Java and ADTs

Hoes does Java support the need for an ADT?
- a Java interface: declares methods to be implemented
  - these methods are public
  - the interface may be package-private
  - there is no constructor defined
- an implementation for all the methods in the interface by a class to be used by a client
- a client program knows the public methods in the interface and can make use of the class that implements the interface
- this is a good approach: to work at a higher level of abstraction, so separate different parts of a complex system
  
Question: why is a constructor never part of an interface?
- because no data members in an interface to initialize
- all data members in interfaces are public static final by default

## Arrays
- a linear sequence of objects of the same type
- size set at initialization and cannot be changed
- items can be accessed through an integer index, ranging from 0 to n-1
- time needed to access an item is independent from the index value
- Notation: elements of an arrays a are:

```java
a[0], a[1], a[2], ..., a[n-3], a[n-2], a[n-1]
```

### Example: Sieve of the Eratosthenes
- algorithm to get prime numbers of a pre-defined number range:

```java
int n = 100;
boolean[] a = new boolean[n];

for (int i = 0; i < n; i++) {
  a[i] = true;
}

for (int i = 0; i < n; i++) {
  if (a[i] != false) {
    for (int j = i; i * j < n; j++) {
      a[i * j] = false;
    }
  }
}
```

## Linked Lists
- most important attributes of a linked list:
  - linear structure: every list node points to the next list node
  - simple operations, like insert and remove
  - head and tail conventions in linked list
- most important basic operations
  - list element insertion
  - list element deletion
- elementary list processing - some important operations
  - list reversal and list traversal
  - list insertion sort (sort while adding)
- circular-list class
- skip lists
- memory allocation for lists (lists can grow, arrays cannot)

### Example of class with linked list data structure

```java
public class LinkedList<E> {

  private static class Node<E> {
    E item;
    Node<E> next;

    Node(E pItem) {
      this.item = pItem;
      next = null;
    }
  }

  private Node<E> list;

  public LinkedList() {
    this.list = new Node<>(null);
  }
}
```

## Data structures: linked list & array

A linked list as a **data structure** and a **general purpose** linked list class are two different things:
- as a **data structure**: a linked list is just one Node class with a next attribute of type Node. No getters or setter or other methods, only a constructor is needed. It's only purpose of existence it to be used in an algorithm. A private static inner class is enough
- a **general purpose** linked list consists of much more code and is complexer. It should function in every possible way, so it is intentionally robust, like the linked list that is provided in the <ins>java.util.LinkedList</ins> package

## Head / Tail / Circular convention
- first node of the list can contain the first item of the list, but can also always be *null*
- if the first node never contains an item, this node is called the **dummy head**. In this case, the first item is stored in the second node
- same with tail: last node can never contain an item, which is the called the **dummy tail**. Here, the last item is stored in the next-to-last node
- if **Circular convention** is used, the last node points to the first, creating a circle

## Options of the final node on linked lists
![linked list end options](pictures/linkedlist_end_options.png)
- A: "normal" linked list, no conventions
- B: tail convention with dummy tail
- C: circular convention

## Java - Linked list deletion
- node reference x points to the node, that has it's next node reference pointing to the node that we want to remove
- to remove the node following node x, we use the statements:

```java
temp = x.next;
x.next = temp.next;
```
- or simply

```java
x.next = x.next.next;
```

## Java - Linked list insertion
- to insert a node t into a list at a position following node x, we use the statements:

```java
t.next = x.next;
x.next = t;
```

## Elementary List Processing
- linked lists as easier re-arrangeable data structures
- instead of avoiding an `IndexOutOfBoundsException` with arrays with linked lists we have to check the references in the list
- basic operations on lists:
  - list traversal
  - add and delete items
  - usage of insertion sort algorithm

## List traversal
- as a contrast to arrays, a method to traverse the list is needed
- if **x** refers to the first node of a list, the final node has a null link 
- **visit** is a method that takes an item as a parameter and checks 

```java
Node t = x;

while(t != null) {
  visit(t.item);
  t = t.next;
}
```

## Head and tail conventions in linked lists
- circular, never empty linked list
- linked list with head reference and dummy tail (most common approach)
- linked list with dummy head and dummy tail
- linked list with dummy head and tail nodes

## Head and tail conventions: circular lists
- first insert:

```java
head.next = head;
```

- insert t after x (t and x are node references, t is a new node):

```java
t.next = x.next;
x.next = t;
```

- remove after x:

```java
x.next = x.next.next;
```

- traversal loop:

```java
t = head;

do {
  ...
  t = t.next;
} 
while (t != head);
```

- test if one item:

```java
head.next == head;
```

## Head and tail conventions: dummy tail
- initialize:

```java
head = null;
```

- insert t after x (t and x are node references, t is a new node):

```java
if (x == null) {
  head = t;
  head.next = null;
} else {
  t.next = x.next;
  x.next = t;
}
```

- remove after x:

```java
t = x.next;
x.next = t.next;
```

- traversal loop:

```java
for (t = head; t != null; t = t.next) {
  ...
}
```

- test if empty:

```java
return head == null;
```

## Head and tail conventions: dummy head and dummy tail
- initialize:

```java
head = new Node();
head.next = null;
```

- insert t after x (t and x are node references, t is a new node):

```java
t.next = x.next;
x.next = t;
```

- remove after x:

```java
t = x.next;
x.next = t.next;
```

- traversal loop:

```java
for (t = head.next; t != null; t = t.next) {
  ...
}
```

- test if empty:

```java
return head.next == null;
```

## Josephus problem
- the josephus problem refers to the problem to select someone to be a leader
- the identity of the elected leader is a function of *N(=9)* and *M(=5)*
- in a range from 1 - 9, one possible outcome can be `5, 1, 7, 4, 3, 6, 9, 2`
- in code:

```java
public class Josephus {
  private static class Node {
    int val;
    Node next;

    Node(int v) {
      this.val = v;
    }
  }

  ...

  public int selectNext(int N, int M) {
    Node head = new Node(1);
    Node current = head;

    for (int i = 2; i <= N; i++) {
      current.next = new Node(i);
      current = current.next;
    }

    current.next = head;

    while (current != current.next) {
      for (int i = 1; i < M; i++) {
        current = current.next;
      }

      current.next = current.next.next;
    }

    return current.val;
  }
}
```

## Possible extension: double linked list
- by adding more links, we can add the capability to move backwards through a linked list
- we can support operations to *"find the item before a given item"* by using a doubly linked list in which we maintain two links for each node:
  - one (`prev`) to the previous item
  - another (`next`) to the next item
- with dummy node or a circular list, we can ensure that `x`, `x.next.prev`, and `x.prev.next` are the same for every node in a doubly linked list
- we then must modify or implement the operations
  - `remove`
  - `insert after`
  - `insert before`

# 3. Complexity of Algorithms <a name="third"> </a>

## Analysis of algorithms: the goals
- perform efficiency analysis
- compare different algorithms fir the same task
- predict their efficiency independent of the environment
- two approaches:
  - **empirical** analysis: by using an existing implementation
  - **theoretical** analysis: before any implementation

## Analysis of algorithms
- how to consider the properties of algorithms?
  - analyse the operations on data
  - what do we know about the expected input data?
- how to determine the efficiency of algorithms?
  - execution time: how does it increase if the data increases?
  - memory usage: how does it increase if the data increases?
- if we have an implementation: empirical analysis
- analysis of algorithms before implementation
  - find the complexity: how does execution time grow if the size of the data grows?
  - Big-Oh notation, useful in derivation of the complexity

## Empirical analysis
- start with existing code
- what can be detected by empirical analysis?
- what is the benefit of an actual running time evaluation?
- assume that two algorithms are given to solve the same problem:
  - we run them both to see which one takes longer
  - if an algorithm is 10 times faster than another, this unlikely escapes the notice of someone who waits 3 seconds for one to finish and 30 seconds for the other to finish
  - is this true for all possible input data and for both algorithms?
  - example: summation of a finite row of numbers

### Example: Gaussian sum

Summation of a finite series: `1 + 2 + 3 + 4 + 5 + ... + n`

```java
public int gaussianSumSimple(int n) {
  int sum = 0;

  for (int i = 1; i <= n; i++) {
    sum = sum + i;
  }

  return sum;
}
```
**Theoretical analysis**: If *N = 30*, then the numbers of additions when the loop is executed is 30. If *N = 30*, then it is 300. --> 10 times as much </br>
**Equal to the growth in N, which means a linear growth** </br>
**Empirical analysis**: run both programmes for different values on *N* and measure the execution time

## The number N
- also known as 'size' of the problem
- *Problem*: as in math, the algorithm we want to implement
- *Size*: N, of the data structure when it is completely filled with the items we are going to use in the algorithm. In the Gaussian Sum example: just the number of integers we are adding to get the sum of them all

## Gaussian Sum Formula

A bit of secondary school math:
```
    sum(N) =   1   +   2   +   3   + .... +  N-1  +   N
    sum(N) =   N   +  N-1  +  N-2  + .... +   2   +   1

2 * sum(N) = (N+1) + (N+1) + (N+1) + .... + (N+1) + (N+1)

2 * sum(N) = N * (N + 1) => sum(N) = N * (N + 1) / 2
```

### Example: Gaussian sum formula

Summation of a finite row of numbers, second implementation

```java
public int gaussianSum(int n) {
  int sum = 0.5 * n * (n + 1);
  return sum;
}
```

**Theoretical analysis**: one addition and two multiplications are needed. Value of *N* does not influence the execution time

Number of operations needed is **independent of the value n**. Complexity is **constant**: no growth

## Empirical analysis
- empirical analysis takes a significant amount of time
  - algorithms need to be implemented first
  - time between tests, can take hours or even days
- 3 different choices for input data:
  - actual data: enable us to measure the running time of the program as in its future system
  - random data: make sure that our experiments test the algorithms, not the data
  - perverse data: assure us that our program can handle any input

## Summary summation example
- in the first implementation we see a relation between the expenditure and the size of the input, i.e. the expenditure grows with increasing N. The expenditure grows linear
- in the second implementation the calculation method is independent of the size N. The expenditure is constant
- apparently the running time depends on the input. It is not always possible to rule this out, but at least we can give it a try

## Theoretical analysis of algorithms

How to do this analysis of algorithms?
- in the analysis of an algorithm we must identify the operations that matter
- the number on operations involved can be large, but the performance of an algorithm mainly depends on loops
- the analysis starts with looking at the structure of the algorithm, e.g. are loops performed as a next statement or as a statement inside another loop?
- Worst-case analysis can be done by determination of **time complexity** (upper bound dependent on the chosen input parameter N) or **space complexity** (upper bound in dependent of the use of storage)
- we will see that the results of
  - 'time complexity' can be converted to 'space complexity' and
  - 'space complexity' can be transferred to 'time complexity'
- more concrete:
  - if you minimize the data structure, the operations could become more complex, which could take more time to complete
  - if you add some memory space, the implementation could become simpler and faster, and also less error prone

## Growth functions

A simple mathematical function is used to denote the complexity of algorithms
- most algorithms have a *primary parameter N*, the 'size of the problem', that affects the running time most significant
- the *parameter N* might be:
  - the size of a file to be sorted or searched
  - the number of characters in a text string
  - some other measure of the size of the problem being considered
- usually **N** is directly proportional to the size of the data set being processed

## Dimension of the problem
- our goal is to express the resource requirements (mostly time, but also space) in terms of *N*, using mathematical formulas
- we are only interested in large values of N
- we can use the following functions to make classifications for all algorithms:

![functions](pictures/complexity_functions.png)

- the functions are: 1, *log(x), x, x * log(x), x^2, x^3, ...*

## Formulas from the Gaussian sums
- the first implementation had a linear running time, which means the formula is *N*
  - when a limited amount of processing is done on each input element, the running time of the program is linear. This running time occurs e.g. in a method where we search a value in an array or list
- the second implementation had a constant running time, which means the formula is *1* 
  - most instructions of most programs are executed once or at most only a few times. If all the instructions of a program have this property, we say that the program's running time is constant
  - doubling the input length *N* hardly influences the running time

## Binary search algorithm: again a loop

The growth of the following implementation is *log(N)*:

```java
public int binSearch(int key) {
  int left = 0;
  int right = ar.length;
  int mid;

  while (left + 1 != right) {
    mid = (left + right) / 2;
    
    if (ar[mid] <= key) {
      left = mid;
    } else {
      right = mid;
    }
  }

  return left;
}
```
the algorithm has a logarithmic running time
- when the running time of a program is logarithmic, then the running time grows slower than any positive power of the N
- binary search is most famous example for logarithmic running time

## Growth function: N * log(N)
- the N * log(N) running time can arise when algorithms solve a problem by breaking it into smaller subproblems, solving independently, and then combining the solutions
- when N doubles, the running time grows a bit more, but always slower than N to a power above 1
- example: good sorting methods, e.g. Quicksort and Heapsort

## Example: method to get distinct triples

```java
// return number of distinct triples (i, j, k)
// such that a[i] + a[j] + a[k] = 0

public int count(int[] a) {
  int N = a.length;
  int cnt = 0;

  for (int i = 0; i < N; i++) {
    for (int j = i + 1; j < N; j++) {
      for (int k = k + 1; k < N; k++) {
        if (a[i] + a[j] + a[k] == 0) {
          cnt++;
        }
      }
    }
  }

  return cnt;
}
```

Growth functions: N^2 and N^3
- N^2:
  - when the running time of an algorithm is quadratic, that algorithm is of practical use for only relatively small problems
  - quadratic running times typically arise in algorithms that process all pairs of data
  - example: two nested loop in Bubblesort
- N^3:
  - similarly, an algorithm that processes triples of data items (perhaps in a triple-nested loop, like in the example) has a cubic running time. When N doubles, the running time increases eightfold

## Values of commonly encountered functions

| N       | log(N) | sqrt(N) | N * log(N)  | N * (log(N))^2 | N^2            |
|---------|--------|---------|-------------|----------------|----------------|
| 10      | 3      | 3       | 33          | 110            | 100            |
| 100     | 7      | 10      | 664         | 4.414          | 10.000         |
| 1.000   | 10     | 32      | 9.966       | 99.317         | 100.000        |
| 10.000  | 13     | 100     | 132.877     | 176.533        | 1.000.000      |
| 100.000 | 17     | 316     | 1,66 * 10^6 | 2,76 * 10^7    | 10.000.000.000 |

If these values are in milliseconds, then N * log(N) for 100.000 entries would take roughly 28 Minutes

## Big-Oh Notation
- Big-Oh notation to compare the efficiency of algorithms
  - in the most cases the implementation of the operations on the data structure determines the efficiency of algorithms
  - on the other hand the choice of the underlying data structure also influences the efficiency. This means if we decide to change the data structure, algorithms can become 'faster'

## Big-Oh notation of f(N)
- to bound the error that we make when we ignore small terms in formulas
- to bound the error that we make when we ignore parts of program that contribute a small amount to the total being analysed
- to allow us to classify algorithms according to upper bounds on their total running times
- 'fast' and 'slow' is determined, which is given by O-notation: *O(f(N))* -> "big Oh of f(N)
  - the O-notation denotes the relation 'is proportional to'

## Examples for O-notation
- essentially, we can expand expressions using O-notation as through the O were not there, then drop all but the largest term
- for example, if we expand the expression:

```
(O(N) + O(1)) * (O(N) + O(1))
```

- we get four terms:

```
     O(N)  * O(N) + O(N) * O(1) + O(1) * O(N) + O(1) * O(1)
<=> O(N^2) + O(N) + O(N) + O(1)
<=> O(N^2) +  2   * O(N) + O(1) 
```

- result: `O(N^2) + 2 * O(N) + O(1)`
- we can drop all terms but the largest O-term, which then results in `O(N^2)`
- this is the dominant term or largest value of N
- we refer to a formula with one O-term as an <ins> asymptotic expression </ins>

## Big-Oh notation in code

we will use again the sieve of eratosthenes:

```java
int n = 100;                            // O(1)
boolean[] a = new boolean[n];           // O(1)

for (int i = 0; i < n; i++) {           // O(N)
  a[i] = true;
}

for (int i = 0; i < n; i++) {           // O(N)
  if (a[i] != false) {                  // O(1)
    for (int j = i; i * j < n; j++) {   // O(sqrt(N))
      a[i * j] = false;                 // O(1)
    }
  }
}
```

# 4. DataStructures_2 <a name="fourth"> </a>
s