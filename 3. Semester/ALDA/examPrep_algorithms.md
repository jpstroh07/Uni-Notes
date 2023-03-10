# Table of Contents
1. [Recursion and Tree traversal](#first)
2. [Intro into Sorters: Selectionsort, Insertionsort & Bubblesort](#second)
3. [Mergesort](#third)
4. [Quicksort](#fourth)
5. [Heaps and Heapsort](#fifth)
6. [Hashing](#sixth)
7. [Tries](#seventh)

# 1. Recursion and Tree Traversal <a name="first"> </a>

## Intro Recursion

Consider the following mathematical relation, which defines the factorial of N:

```
N! = N * N(N-1)! , N >= 0 , (0! = 1)

Example:

6! = 6 * 5! = 6 * 5 * 4! = 6 * 5 * 4 * 3! = 6 * 5 * 4 * 3 * 2! = 6 * 5 * 4 * 3 * 2 * 1
   = 6 * 20 * 6
   = 6 * 120
   = 720
```

- A simple for-loop could perform this calculation
- It is always possible to transform a recursive program into a non-recursive and vice versa
- Sometimes it is much simpler to design a recursive program instead of a correctly terminated loop

## Recursive factorial method

```Java
static int factorial(int N) {
    if (N == 0) {
        return 1;
    } else {
        return N * factorial(N - 1);
    }
}
```

- This code computes 0! as a **base step**
- Before it computes N!, it computes (N - 1)!
- All the calls of the `factorial` method are temporarily stored on the method call stack

## Rules of thumb

To do recursion correctly, these properties must be satisfied:
- Explicitly solve a basic case (**base step**)
- Recursive call with *smaller* arguments
- Recursive calls should not address sub problems that overlap

## Example: Euclid's algorithm

Find the greatest common divisor of two numbers *M* and *N*, with *M > N*
- If M and N have a common divisor p, then p also is a divisor of (M mod N)
- The largest possible value of p is N
- If at some point p equals N, we have: (M mod N) = 0, and the algorithm has to stop

```Java
/**
 *  pre:  M > N
 *  post: M = gcd(M, N)
 */

// recursive method
int gcd(int M, int N) {
    if (N == 0) {
        return M;
    } else {
        return gcd(N, M % N);
    }
}

// non-recursive method
int gcd(int M, int N) {
    int h;

    while (N != 0) {
        h = N;
        N = M % N;
        M = h;
    }

    return M;
}
```

## Example: Binary Search in a sorted way

- Array: comparable items
- Search between l (left) and r (right) indices: `l <= r`
- Middle value: m = (l + r) / 2
  
```Java

// non-recursive method

int indexOf(Comparable item) {
    int l = 0;
    int r = this.size - 1;
    int m = 0;

    while (l <= r) {
        m = (l + r) / 2;
        int cmp = items[m].compareTo(item);

        if (cmp == 0) {
            break;
        } else if (cmp > 0) {
            r = m - 1;
        } else {
            l = m + 1;
        }
    }
    return m;
}

// recursive method

int indexOf(Comparable key, Comparable[] a, int lo, int hi) {
    if (lo > hi) {
        return -1;
    }

    int mid = (lo + hi) / 2;
    int cmp = key.compareTo(a[mid]);

    if(cmp < 0) {
        return indexOf(key, a, lo, mid - 1);
    } else if (cmp > 0) {
        return indexOf(key, a, mid + 1, hi);
    } else {
        return mid;
    }
}
```

## Remarks: Recursion and data structures

- Depth of Recursion: Is the maximum degree of nesting and depends on the input
- Recursive programs: Requires a push-down stack of the size proportional to the depth of the recursion
- Data structures: Are inherently recursive if the objects in it contain a reference to objects of the same type
- Therefore, Recursive programs provide a natural implementation for such data structures, e.g. a Linked List
- Be careful: The depth of the recursion could become of the order of the length of a length of a Linked List

## Example: Recursive methods for Linked Lists

```Java
// number of nodes in the list
int count(Node h) {
    if (h == null) {
        return 0;
    } else {
        return 1 + count(h.next);
    }
}

// traversing through the list
void traverse(Node h) {
    if (h == null) {
        return;
    }

    h.item.visit();
    traverse(h.next);
}

// removing a node
Node remove(Node h, Item v) {
    if (h == null) {
        return null;
    }

    if (equals(h.item, v)) {
        return remove(h.next, v);
    }

    h.next = remove(h.next, v);

    return h;
}
```

## Trees

Trees can be used:
- to describe dynamic properties of algorithms
- using and building data structures that are concrete realizations of trees
- other places: family trees, directory-file structure on computers, ...

Different types of trees:
- Binary trees
- Ternary trees
- M-ary trees
- Tries

## Definition of trees

A **binary tree** is an external node or an internal node connected to a pair of binary trees, which are called the left subtree and the right subtree of that node.

An **M-ary tree** is either an external node or an internal node connected to an ordered sequence of M trees that are also M-ary trees.

=> Recursion is a natural property of trees

## Tree traversal

Binary trees have two links and therefore have three basic orders in which the nodes can be visited:
- Pre-order:  node - left  - right
- In-order:   left - node  - right
- Post-order: left - right - node

![tree traversals](pictures/tree_PIP.png)

Pre-order traversal, recursive:

```Java
void traverse() {
    traversePreR(root);
}

private void traverseR(Node h) {
    if (h == null) {
        return;
    }

    h.item.visit();
    traverseR(h.left);
    traverseR(h.right);
}
```

## Non-recursive tree traversals

Non-recursive pre-order traversal:
- In the non-recursive approach there is an explicit Stack
- The program uses the Stack to keep track of the right order to visit the nodes
- The Stack does not have a maximum size, assuming there will be no memory problem

Level-order traversal
- Another way to traverse a tree is **level-order**: From top to bottom visit each node from left to right at one level before going to the next lower level
- Here, a Queue is used, again without a maximum value

```Java
// pre-order traversal, non-recursive
private void traversePreNR(Node h) {
    Stack<Node> s = new Stack<>();
    s.push(h);

    while (!s.isEmpty()) {
        h = s.pop();
        h.item.visit();

        if (h.right != null) {
            s.push(h.right);
        }

        if (h.left != null) {
            s.push(h.left);
        }
    }
}

// in-order traversal, non-recursive
// not ideal and more complicated, recursive would be better
public void inOrderNR() {
    Stack<Node> s = new Stack<>();
    Node node = tree;

    while (!s.isEmpty() || node != null) {
        if (node != null) {
            s.push(node);
            node = node.left;
        } else {
            node = s.pop();
            System.out.println(node.item + " ");
            node = node.right;
        }
    }
}

// level-order traversal, non-recursive
private void traverseLevNR(Node h) {
    Queue<Node> q = new Queue<>();
    q.put(h);

    while (!q.isEmpty()) {
        h = q.get();
        h.item.visit();

        if (h.left != null) {
            q.put(h.left);
        }

        if (h.right != null) {
            q.put(h.right);
        }
    }
}
```

## Recursive Binary Tree algorithms

Useful basic computations and operations for binary trees:

```Java
// counting nodes
public int count() {
    return count(root);
}

private int count(Node h) {
    if (h == null) {
        return 0;
    }

    return 1 + count(h.left) + count(h.right);
}

// calculating height
public int height() {
    return height(root);
}

private int height(Node h) {
    if (h == null) {
        return -1;
    }

    int u = height(h.left);
    int v = height(h.right);

    if (u > v) {
        return u + 1;
    } else {
        return v + 1;
    }
}
```

# 2. Basic Sorters <a name="second"> </a>

## Basic Terminology

- Methods for sorting files of items containing **keys**
- Items will be sorted in such a way, that their keys are ordered according to some well-defined ordering
- Usually numerical or alphabetical order
- Sorting methods that fit into memory are called **internal sorting**
- Sorting methods using external storage, e.g. disk, are named **external sorting**
- Applied data structures for internal sorting: Arrays and Linked Lists

## Calculation of complexity for a sorting algorithm

Note that the running time of a sorting algorithm is proportional:
- to the number of **comparisons** that the algorithm uses
- to the number of times that elements are **exchanged** (or moved)
- or both of these points

## Overview of sorting methods

- Basic sorting methods: complexity O(N^2)
  - Selectionsort
  - Insertionsort
- Advanced sorting methods: complexity O * (N * log(N))
  - Mergesort
  - Quicksort
  - Heapsort
- Items to be sorted have a **key** and a **value**
- For the moment we assume that there are no duplicates in the list, so all keys are unique
- When we talk about a list, we do not refer to any implementation such as making use of a Linked List
- In all algorithms we sort for a non-decreasing list of items

## Property: Stable sorting mechanisms

**Definition**: </br>
A sorting method is said to be **stable** if it preserves the relative order of items with duplicated keys in the file
- Not all elementary sorting methods are stable
- This means that stability is a certain property without using significant extra time or space
- Instability becomes visible after two consecutive sort actions on the same list, in which the second key has duplicate values

## Stable sort example

Consider the following table:

| Column 1       | Column 2       | Column 3       |
|----------------|----------------|----------------|
| Adams - 1      | Adams - 1      | Adams - 1      |
| Black - 2      | Smith - 1      | Smith - 1      |
| Brown - 4      | Washington - 2 | Black - 2      |
| Jackson - 2    | Jackson - 2    | Jackson - 2    |
| Jones - 4      | Black - 2      | Washington - 2 |
| Smith - 1      | White - 3      | White - 3      |
| Thompson - 4   | Wilson - 3     | Wilson - 3     |
| Washington - 2 | Thompson - 4   | Brown - 4      |
| White - 3      | Brown - 4      | Jones - 4      |
| Wilson - 3     | Jones - 4      | Thompson - 4   |

- Column 1: sorted by the first key (name)
- Column 2: result of a non-stable sort of the first column on the second key (number)
- Column 3: result of a stable sort of the first column on the second key (number)

## Working process of selection sort

The idea behind Selectionsort is the following:

1. Find the smallest element in the array
2. Exchange this element with the element in the first position
3. Find the second smallest element in the array
4. Exchange this element with the element in the second position
5. etc.
6. Continue in this way until the entire array is sorted

This sorting method is calls Selectionsort because it works by repeatedly selecting the smallest remaining element

## Selectionsort program with an array data structure

```Java
public class BasicSorter<T extends Comparable<T>> {
    
    private T[] arr;
    private int N = 0;

    public BasicSorter(T[] arr) {
        this.arr = arr;
        N = arr.length;
    }

    public void selectionSort() {
        for (int i = 0; i < N; i++) {
            for (int j = i + 1; j < N; j++) {
                if (less(j, i)) {
                    exch(j, i);
                }
            }
        }
    }

    private boolean less(int a, int b) {
        return arr[a].compareTo(arr[b]) < 0;
    }

    private void exch(int j, int i) {
        T tmp = arr[j];
        arr[j] = arr[i];
        arr[i] = tmp;
    }
}
```

Notes to this implementation:
- The code is split over several methods such that the sort-method contains the essential part of the algorithm
- The implementation always does _N * (N - 1) / 2_ comparisons and possibly an equal amount of exchanges

## Selectionsort improvement

- An improvement can be made to reduce the amount of exchanges by adding a bit more memory usage: We introduce a variable `min`, where we store the momentary minimum value found. Then, if this minimum value has been found we perform only one exchange in each iteration of the outer loop
- This improvement is an example of time and space trade off: The execution time can be shortened at the expense of a bit more memory usage

The improvement:

```Java
public void selectionSort(Comparable[] arr) {
    int N = arr.length;

    for (int i = 0; i < N; i++) {
        int min = i;

        for (int j = i + 1; j < N; j++) {
            if(less(arr[j], arr[min])) {
                min = j;
            }
        }

        exch(arr[i], arr[min]);
    }
}
```

## Properties of the Selectionsort mechanism

- The inner loop is just a comparison to test a current element against the smallest element found so far (plus the code necessary to increment the index of the current element and to check that it does not extends the array bounds)
- The work moving the elements around falls outside the inner loop
- Each exchange puts an element into its final position
- The number of exchanges using the selection sort is N - 1 (no exchange is needed for the final element)
- The Selectionsort needs no extra memory

## Complexity of Selectionsort

- To calculate the time complexity, we can assume that the algorithm in action randomly permutes the items that must be sorted
- In each step 1 element might have to be exchanged
- We can state that
  - There is a maximum total of N - 1 exchanges
  - `(N - 1) + (N - 2) + (N - 3) + ... + 2 + 1 = N * (N - 1) / 2` comparisons
- The selection sort needs quadratic time in the worst and in the average case: The time complexity is *O(N^2)*
- The running time is insensitive to the input

## Insertionsort

The idea behind Insertionsort is:

- To insert the element into its proper place among the those already considered (keeping them sorted)
- In a computer implementation we need
  - To make space for the element being inserted by moving larger elements to the right
  - Then inserting the element into the vacant position

This sorting method is named Insertionsort because it works by repeatedly inserting the element to its proper place

## Example for Insertionsort

```Java
public void insertionSort(Comparable[] arr) {
    int N = arr.length

    for (int i = 1; i < N; i++) {
        for (int j = i; j > 0 && less(arr[j], arr[j - 1]); j--) {
            exch(arr, j, j - 1);
        }
    }
}
```

- The sort method does N - 1 comparisons in best case, (N - 1)^2 in worst case and (N - 1)^2 / 4 on average
- The method does at least 0 but at most (N - 1)^2 / 2 exchanges, (N - 1)^2 / 4 on average

## Improvements for Insertionsort

- Test for j > 0
  - The first improvement is the test for j > 0. The test is necessary only in case the element inserted is the smallest element in the entire array
  - A solution: sentinel at a[0]
    - One improvement is to keep the keys to be sorted in a[1] to a[N] and to put a sentinel key in a[0], making it at least as small as the smallest key in the array
    - A simple solution is to put the smallest element in the first position of the array
    - Note: Sentinels are sometimes inconvenient; The smallest key might not easily to be found
- Avoiding unnecessary exchanges
  - Successive exchanges involving the same element are inefficient. If two exchanges take place one after the other, we have:

```Java
t = a[j]; a[j] = a[j - 1]; a[j - 1] = t
```
  - Followed by 

```Java
t = a[j - 1]; a[j - 1] = a[j - 2]; a[j - 2] = t
```
  - The value of t does not change. This can be improved by shifting the elements one position to the right instead of using exchanges

## Improved code for Insertionsort

```Java
public void insertionSort(Comparable[] arr) {
    int N = arr.length;

    for (int i = 1; i < N; i++) {
        if (arr[i] < arr[0]) {
            exch(i, 0);
        }
    }

    for (int i = 1; i < N; i++) {
        int j = i;
        Comparable v = a[j];

        while (less(v, a[j - 1])) {
            a[j] = a[j - 1];
            j--;
        }

        a[j] = v;
    }
}
```

- In comparison to the first insertion sort implementation, this implementation is nearly twice faster (but still: O(N^2))
- We removed compExch operations from the inner `while`-loop
- We saw: The extra space needed to store the value of the item to be inserted made it possible to make the algorithm faster

=> Again an example of the trade off between running time and memory space

## Complexity of Insertionsort

- By applications of the improvements given, we expect each element of a random input to about halfway back, on average
- Insertionsort uses about
  - N^2 / 4 comparisons
  - N^2 / 4 half of the exchanges on average
  - twice that many at worst
- Time complexity: O(N^2)

## Bubblesort

Bubblesort works in this way:
- Keep passing through the array
- Exchanging **adjacent elements** that are out of order
- Continuing until the array is sorted

## Bubblesort implementation

```Java
public void bubbleSort() {
    for (int i = 0; i < arr.length; i++) {
        for (int j = arr.length - 1; j > i; j--) {
            compExch(j, j - 1);
        }
    }
}
```

## Properties of Bubblesort

- Suppose that we always move from right to left through the array in the inner loop
- When a smaller element is encountered during the first pass, we exchange it with the element to its left, eventually putting it into the first position of the array
- Then on the second pass, the second smallest element will be put on the second position, and so on
- Thus, N passes suffice, and the Bubblesort operates as a type of selection sort

## Complexity of Bubblesort

- The i-th Bubblesort pass requires N - i compare-exchange operations
- When the algorithm is modified to terminate when it discovers that the file is sorted, the running time depends on the input
- But the i-th pass requires N - i comparison and exchanges if the file is in reverse order
- Bubblesort uses
  - N^2 / 2 comparisons
  - N^2 / 2 exchanges on average and in the worst case
- Time complexity: O(N^2)

## Summary: Elementary sorting methods

The time complexity of a sorting algorithm is proportional
- to the number of comparisons that the algorithm uses
- to the number of times that items are moved or exchanges
- or both

|               | Comparison                   | Exchange                     | Complexity |
|---------------|------------------------------|------------------------------|------------|
| Selectionsort | N^2 / 2 in ac & wc           | N in ac & wc                 | O(N^2)     |
| Insertionsort | N^2 / 4 in ac; N^2 / 2 in wc | N^2 / 4 in ac; N^2 / 2 in wc | O(N^2)     |
| Bubblesort    | N^2 / 2 in ac & wc           | N^2 / 2 in ac & wc           | O(N^2)     |

**ac**: Average case </br>
**wc**: Worst case

# 3. Mergesort <a name="third"> </a>

## Word definitions

- Merging: Take two sorted data structures and fill one new data structure, which will then be sorted too
- Mergesort: Repeatedly merge two parts of a data structure in a systematic way to sort the whole data structure

## Merge sort

```Java
void sort(Comparable[] a, Comparable[] aux, int lo, int hi) {
    if (hi <= lo) {
        return;
    }

    int mid = (lo + hi) / 2;

    sort(a, aux, lo, mid);
    sort(a, aux, mid + 1, hi);

    merge(a, aux, lo, mid, hi);
}

private void merge(Comparable[] a, Comparable[] aux, int lo, int mid, int hi) {
    for (int k = lo; k <= hi; k++) { // copy a[] to aux[]
        aux[k] = a[k]
    }

    int i = lo;
    int j = mid + 1;

    for (int k = lo; k <= hi; k++) { // merge back to a[]
        if (i > mid) {
            a[k] = aux[j++];
        } else if (j > hi) {
            a[k] = aux[i++];
        } else if (less(aux[j], aux[i])) {
            a[k] = aux[j++];
        } else {
            a[k] = aux[i++];
        }
    }
}
```

- The merge method merges the array ranges: `[lo ... mid] & [mid + 1 ... hi]`
- The array `aux` is an auxiliary array, so additional storage is used
- When the Mergesort is imagined as a tree, this is the top-down approach. It is also possible to create a bottom-up approach:

```Java
// non-recursive
void sort(Comparable[] a) {
    int N = a.length;
    Comparable[] aux = new Comparable[N];

    for (int n = 1; n < N; n = n + n) {
        for (int i = 0; i < N - n; i += n + n) {
            int lo = i;
            int m = i + n - 1;
            int hi = Math.min(i + n + n - 1, N - 1);

            merge(a, aux, lo, m, hi);
        }
    }
}
```

# 4. Quicksort <a name="fourth"> </a>

## Working process of Quicksort

- Quicksort is a *divide-and-conquer* algorithm
  - Dividing a problem into smaller, easier solvable sub-problems
- How Quicksort works
  - Partitioning of any array in two parts
  - Then sorting the parts independently
- The method is based on the following process
  - After the partitioning: `a[lo ... i - 1] <= a[i] <= a[i + 1 ... hi]`
  - Conclusion: **Element a[i] is in its final place in the array**
- a[i] is called the *partitioning element*
  
## Basic structure of the recursive quicksort routine

```Java
void sort(Comparable[] a, int lo, int hi) {
    if (hi <= lo) {
        return;
    }

    int j = partition(a, lo, hi);

    sort(a, lo, j - 1);
    sort(a, j + 1, hi);
}
```

## Partitioning for Quicksort

```Java
int partition(Comparable[] a, int lo, int hi) {
    int i = lo; 
    int j = hi + 1;
    Comparable v = a[lo];

    while (true) {
        while (less(a[i++], v)) {
            if (i == hi) {
                break;
            }
        }

        while (less(v, a[j--])) {
            if (j == lo) {
                break;
            }
        }

        if (i >= j) {
            break:
        }

        exch(a, i, j);
    }

    exch(a, lo, j);

    return j;
}
```

## Performance of Quicksort

- Worst case situation
  - The number of comparisons used for a file that is already in order is: `N + (N - 1) + (N - 2) + ... + 2 + 1 = (N + 1) * N / 2`
  - All the partitions are also degenerate for files in reverse order
  - Quicksort uses about N^2 / 2 comparisons in the worst case
  - The time complexity in the worst case is O(N^2), which is unacceptable for large files
  - It is relatively easy to reduce the time complexity for the best case
- Best case situation
  - The best case for quicksort is when each partitioning stage divides the file exactly in half
  - Things do not fo always this well, it is true that the partition falls in the middle on the average
  - Quicksort uses about 2 * N * log(N) comparisons on the average
  - The time complexity in the average case is O(N * log(N))

## Small sub-files (sub-arrays)

- A definite improvement of the Quicksort arises from the observation that a recursive program is guaranteed to call itself for many sub-files
- To overcome this problem, we can change the test at the beginning of the recursive method from a `return` on insertion sort as follows
  
```Java
if (hi - lo <= M) {
    insertion(a, l, r);
}
```
- M is some parameter whose exact value depends upon the implementation
- We can determine an optimal value for M either through analysis or empirical studies

Alternative solution:
- It is slightly easier not to handle smaller sub-files, which are also slightly more efficient than insertions sorting them. We obtain for the test at the beginning:

```Java
if (r - l <= M) {
    return;
}
```

- After a Quicksort, apply Insertionsort on complete array. Since the array is almost sorted, Insertionsort is efficient
- This technique can be used to good advantage whenever we are dealing with recursive algorithm
- We can be sure that all recursive algorithms will be processing small problem instances for a high percentage of time
- In general, a low-overhead brute-force algorithm without much overhead is available
- We therefore generally can improve overall timing with **hybrid algorithms**

## Median of three partitioning

- Another improvement is to choose a partitioning element that is more likely to divide the file near the middle
- There are several approaches, but the most well-known way to find a better partitioning element is to take a sample of three elements from the file, then to use the media of three for a partitioning element
- By choosing the three elements from *left, middle* and *right*, we can incorporate sentinels:
  - 1. Sort the three elements
  - 2. Exchange the one in the middle with `a[r - 1]`
  - 3. Run the partitioning algorithm on `a[l + 1], ..., a[r - 2]`
- This method is called the *median-of-three* method
- The steps above assume that the pivot is the right outer most array value

## Improved Quicksort with median-of-three

```Java
void quicksort(Comparable[] a, int l, int r) {
    exch(a, (l + r) / 2, r - 1);
    compExch(a, l, r - 1);
    compExch(a, l, r);
    compExch(a, r, r - 1);

    int i = partition(a, l + 1, r - 1);

    quicksort(a, l, i - 1);
    quicksort(a, i + 1, r);
}
```

## Properties of the media-of-three method

- The median-of-three methods helps quicksort in three ways:
  - 1. It makes the worst case much more unlikely to occur in any actual sort
  - 2. It eliminates the need for a sentinel key for partitioning
  - 3. It reduces the total average running time of the algorithm by about 5%
- The combination of using median-of-three with a cutoff for small sub-files can improve the running time of the over the native implementation by **20% - 25%**
- The median-of-three method is a special case of the general idea to estimate properties of the whole file
- For Quicksort, we want to estimate the median to balance the partitioning
- It is the nature of the algorithm that we do not need a particular good estimate: We just want to avoid a particular bad estimate
- If we randomly chose three of five elements from the file, then we use the media of that sample for the partitioning, we get a better partition, but the improvement is offset by the cost of taking the sample

## Duplicate key

- When there are many duplicate keys present in the file to be sorted, the Quicksort does not have unacceptably poor performance, but they can be substantially improved
- In a situation where there are large numbers of duplicate keys in the input file, the recursive nature of the Quicksort ensures that sub-files consisting solely of items with a single key value will often occur, so there is potential for significant improvement
- One straightforward idea is to partition the file into three parts, one for each key smaller than, equal to and larger than the partitioning element

## Method of Bentley and McIlroy (1993)

A clever method for three-way partitioning works by modifying the standard partitioning scheme as follows:
- Keep keys equal to partitioning element that are encountered in the left sub-file at the left of the file, and
- Keep the keys equal to the partitioning element that are encountered in the right sub-file at the right end of the file
- During the partitioning process, we maintain the following situation
- Then, when the indices cross and the precise location for the equal keys is known, we swap into position all item with keys equal to the partitioning element
- The extra overhead for duplicate keys is proportional to only the number of duplicate keys found
- This method also works, if there are no duplicate keys. There is no extra overhead
- This additional method for duplicate keys is linear time when there is only a constant number of key values

## Better Quicksort with 3-way partitioning

```Java
// improved algorithm by Bentley and MdIlroy
private void quicksort(Comparable a[], int l, int r) {
    if (r <= l) {
        return;
    }

    Comparable v = a[r];
    int i = l - 1;
    int j = r;
    int p = l - 1;
    int q = r;
    int k;

    while (true) {
        while (less(a[i++], v));
        while (less(v, a[j--])) {
            if (j == l) {
                break;
            }
        }

        if (i >= j) {
            break;
        }

        if (equal(a[i], v)) {
            p++;
            exch(a, p, i);
        }

        if (equal(v, a[j])) {
            q--;
            exch(a, q, j);
        }
    }

    exch(a, i, r);
    
    j = i - 1;
    i++;

    for (k = l, k <= p; k++) {
        exch(a, k, j);
    }

    for (k = r - 1; k >= q; k--) {
        exch(a, k, i);
    }

    quicksort(a, l, j);
    quicksort(a, i, r);
}
```

- The example depicts the process of putting all keys equal to the partitioning element into position
- We scan from the left to find an element that is not smaller then the partitioning element that the partitioning element from the right to find an element that is not larger than the partitioning element, then exchange them
- If the element on the left after the exchange is equal to the partitioning element, we exchange it to the left end of the array; We processed similar on the right
- When the indices cross, we put the partitioning element into position as before (next-to-bottom line), then exchange all the keys equal to it into position on either side of it (bottom line)

# 5. Heaps and Heapsort <a name="fifth"> </a>

## Heap definition
- A **Heap** is a <ins>Binary Tree</ins>
- A heap is organised: It is ordered to some degree
- The heap condition is: The key in each **parent** is <ins>never larger</ins> than the keys in both of it's **child** notes
- A heap is a binary tree that satisfies the heap condition
- This heap is called a **minimum heap**
- If every parent is <ins>never smaller</ins> than it's children, the heap is called a **maximum heap**

## Example: Heap

![heap](pictures/heap_example.png)

This is a **maximum** heap, because the keys are characters and the natural ordering is the alphabet

## Considering Elementary Implementations

- Stacks and Queues: constant time operations exist for push / put and pop / get
- Inserting AND removing the maximum operations in constant time is a more difficult task
- Option 1: Keep sequence ordered -> remove and find max in constant time; not so for insert
- Option 2: Do not keep sequence ordered -> insert in constant time; not so for remove and find max
- Eager / lazy: lazy if work is delayed until it is necessary

## Complexity of heap operations compared to alternatives

|                 | insert | remove min / max | find min /  max |
|-----------------|--------|------------------|-----------------|
| ordered array   | N      | 1                | 1               |
| ordered list    | N      | 1                | 1               |
| unordered array | 1      | N                | N               |
| unordered list  | 1      | N                | N               |
| heap            | log(N) | log(N)           | 1               |

=> General term for a data structure with these three operations is the **Priority Queue**

## A max-heap (same for min-heap)

- Definition heap ordering (the heap condition)
  - A binary tree is **heap-ordered** if the key in each node is larger than or equal to the keys in that node's children (if there are any)
- Definition proposition O.
  - The largest key in a heap ordered binary tree is found at the root
    - The heap-ordered tree is preferred to be complete: all levels filled except the lowest
- Definition proposition P.
  - The height of a complete binary tree with N nodes is |log(N)|
  
## Heapifying

- Keep the heap condition satisfied: Heapifying or fixing the heap
- The heap condition is a so called **invariant** (something that does not change), every operation on the heap should obey this invariant
- If a node's key (inside the item) becomes larger than that node's parents key, these nodes must be exchanged so the node with the larger key is the parent and the node that was the parent is now its child
- If a node's key becomes smaller than one or both of its children's key, then the parent node needs to be exchanged with the node which holds the largest key
- Swim and sink methods provide the tolls to fix the heap when an item is inserted or when it's priority has changed

```Java
private void swim(int k) {
    while (k > 1 && less(k / 2, k)) {
        exch(k, k / 2);
        k = k / 2;
    }
}

private void sink(int k, int N) {
    while (2 * k <= N) {
        int j = 2 * k;
        if (j < N && less(j, j + 1)) {
            j++;
        }

        if (!less(k, j)) {
            break;
        }

        exch(k, j);
        k = j;
    }
}
```

## Heap-based Priority Queue

```Java
public class Heap<Item> implements Iterable<Item> {

    private Item[] pq;
    private int N;
    private Comparator<Item> comp;

    public Heap(Item[] keys) {
        N = keys.length;
        pq = (Item[]) new Object[keys.length + 1];

        for (int i = 0; i < N; i++) {
            pq[i + 1] = keys[i];
        }

        heapify();
    }
    
    private void heapify() {
        for (int k = N / 2; k >= 1; k--) {
            sink(k);
        }
    }
}
```

## Complexity of algorithms on Heaps

- The **insert** operation for the ADT Priority Queue can be implemented with heap-ordered trees in such a way that insert requires no more than `1 + log(N)` comparisons
- The **remove max** operation for the ADT Priority Queue can be implemented with heap-ordered trees in such a way that no more than `2 * log(N)` comparisons are required

## Heapsort

- Heapsort works like Selectionsort
- Remove the root and place the last element (according to level traversal) at the root
- The new root will make that the tree is not a heap anymore, so the tree needs to be heapified to be considered a heap again

## Heapsort algorithm

```Java
public void sort(Comparable[] a) {
    // exchange nodes to make the tree a heap (Node with index k = N / 2 is the last parent node)
    for (int k = N / 2; k >= 1; k--) {
        sink(a, k, N);
    }

    // exchange max item (index 1) with last node of unsorted part of the tree (index N) -> functions as a Selectionsort
    while (N > 1) {
        exch(a, 1, N--);
        sink(a, 1, N);
    }
}
```
## Heapsort properties

**Definition proposition S.**
- Heapsort uses fewer than 2 * N * log(N) compares and half that many exchanges to sort N items
- Property S and the in-place property are important for practical reasons
  - Heapsort guarantees the in-place sorting of N items in time proportional to N * log(N)
  - There is no worst-case input that makes the Heapsort significant slower (unlike Quicksort)
  - Heapsort does not use extra space (unlike Mergesort)

# 6. Hashing <a name="sixth"> </a>

## Why Hashing

- Key-Value pairs are used very often
- Needed: quick find (O(1)) & fast insert
- Already used from package <ins>java.util.Map</ins>
- General term is **Symbol Table**

## Hashing

- Hashing is a technique that is typically applied to implement dictionaries (key-value data structure)
- In a hash, keys can be related to more than one entry, because the list of keys is always finite
- If that happens, this is called a **collision**
- Resolving a collision takes time, preventing collisions can be done by adding memory
- Hashing is *finding items in a table directly by performing some kind of calculation*
- There are several techniques
  - Separate chaining
  - Linear probing
- The calculation to be performed is done by a **hash-function**
- This function calculates an index for a given key

## Basic Idea

- Searching by using hashing consists of two separate parts:
  - 1. Computing a hash function that transforms the **search key** into the **table address**
  - 2. A method to resolve a possible collision
- The hash function maps, keys to a position in a hash table

## Basic way of operation

1. An item i has a key k and h(x) is a hash function
2. The item i is stored in position h(k) of the table
3. If the position was free: No collision
4. If not free: there is a collision. i needs to be stored somewhere else, while also making sure that the item can be found again
5. To search for i, we compute h(k) to locate its position
6. If no item exists, the dictionary does not contain i
7. To make all of this work, an overridden `equals`-method needs to be used

## A time-space tradeoff

- Hashing is a good example of a time-space tradeoff
- Consider the following extremes:
  - 1. If there were no memory limitations, then we could do any search with only one memory access by using a key as a memory address. The amount of memory required is prohibitive when the keys are long
  - 2. If there were no time limits, then we could get by with only a minimum amount of memory by using a sequential search method
- Hashing provides a way to use a reasonable amount of both memory and time to strike a balance
- We can strike any balance we choose, merely adjusting hash table size, not rewriting code or choosing other algorithms
- We support the important operations *search* and *insert*
- In the average case both operations need constant time
- Hashing does not provide efficient implementations for operations such as select or sort

## Hash functions

- If the key range is too large, then we have to apply a hash table with fewer buckets and a hash function which maps multiple keys to the same bucket. If h(k1) = ?? and h(k2) = ??, k1 and k2 collide at bucket ??
- Popular hash functions use hashing by division: h(k) = k % M; Where M number of buckets in the hash table

## Example

Hash table with 11 buckets

```Java
h(k) = k % 11

80 -> 3 (80 % 11 = 3)
40 -> 7
65 -> 10
58 -> 3 -> collision
```

## String keys

- We considered keys given by numbers so far
- Java implementations are realized via hash functions for string keys. The key is computed by multiplication and addition per character in the key

Horner's method, with conversion to array index:

```Java
int hash(String s, int M) {
    int h = 0;
    int R = 127;

    for (int i = 0; i < s.length(); i++) {
        h = (R * h + s.charAt(i)) % M;
    }

    return h;
}
```

## Implementation for user define type

```Java
public class Transaction {

    private final String who;
    private final Date when;
    private final double amount;

    public int hashCode() {
        int hash = 17;

        hash = 31 + hash + who.hashCode();
        hash = 31 * hash + when.hashCode();
        hash = 31 * hash + ((Double) amount).hashCode();

        return hash;
    }
}
```

## Three primary requirements for a good hash

1. It should be consistent: equal keys must produce the same hash value
2. It should be efficient to compute
3. It should uniformly distribute the keys

=> A "bad hash function" is a classic example of a performance bug

## Collision Resolution Policies

- The collision resolution impacts the choice of the hashing function
- We identify two different types of hashing:
  - 1. Closed hashing (**open addressing**)
  - 2. Open hashing (**separate chaining**)
- The differences are
  - Collision result in storing one of the records at another bucket in the table (**closed hashing**)
  - Collisions are stored outside the table (**open hashing**)

## Rehash strategy: Linear-probing

- **Goal**: Find an empty bucket
- Assumption J: The hash functions we use distribute keys uniformly and independently
- Associated with closed hashing is a rehash strategy: If we try to place x in the bucket h(x) and find it occupied, find an alternative location h1(x), h2(x), ... Try each in order, if none of the buckets is empty, then the table is full
- h(x) is called the *home* bucket
- Rehash
  - Make a plan / strategy for calculating a new hash value
  - The simplest rehash strategy is called *linear hashing* or *linear probing*: `hi(x) = (h(x) + i) % M`
  - Our collision resolution strategy is to generate a sequence of hash table buckets (probe sequence) that can hold the record
  - Test each bucket until we find an empty one (probing)

## Example: Closed hashing

- M = 8, the keys a, b, c have the hash values: h(a) = 3, h(b) = 0, h(c) = 4 and have been inserted
- Where do we insert d if h(d) = 3? Bucket 3 is already filled
- The probe sequence using linear hashing is

```Java
h1(d) = (h(d) + 1) % 8 = 4 % 8 = 4
h2(d) = (h(d) + 2) % 8 = 5 % 8 = 5
h3(d) = (h(d) + 3) % 8 = 6 % 8 = 6

etc.

7, 0, 1, 2
```
- Wraps around the beginning of the table
- Result:

| Key | Value |
|-----|-------|
| 0   | b     |
| 1   |       |
| 2   |       |
| 3   | a     |
| 4   | c     |
| 5   | d     |
| 6   |       |
| 7   |       |

## Implementation of Linear Probing Algorithm

```Java
public class LinearProbingHashST<Key, Value> {

    private int N;           // number of key-value pairs in table
    private int M = 16;      // size of linear probing table
    private Key[] keys;      // the keys
    private Value[] values;  // the values

    public LinearProbingHashST() {
        keys = (Key[]) new Object[M];
        values = (Value[]) new Object[M];
    }

    private int hash(Key key) {
        return (key.hashCode() & 0x7fffffff) % M;
    }

    public void put(Key key, Value val) {
        if (val == null) {
            delete(key);
        }

        if (N >= M / 2) {
            resize(2 * M);
        }

        for (int i = hash(key); keys[i] != null; i = (i + 1) % M) {
            if (keys[i].equals(key)) {
                values[i] = val;
                return;
            }
        }

        keys[i] = key;
        values[i] = val;
        N++;
    }

    public Value get(Key key) {
        for (int i = hash(key); keys[i] != null; i = (i + 1) % M) {
            if(keys[i].equals(key)) {
                return values[i];
            }
        }

        return null;
    }
}
```

## Operations and Linear Probing: removing

- Consider search an item: examine h(k), h1(k), h2(k), ..., until we find k or an empty bucket or home bucket
- If no deletions are possible, the strategy works
- What happens if deletions must be done?
- If we reach an empty bucket, we cannot be sure that k is not somewhere else and empty bucket was occupied when k was inserted
- We need a special placeholder *deleted*, to distinguish bucket that was never used from one that held once a value
- We may need to reorganize the hash table after many deletions

## Implementation continued

```Java
public void delete(Key key) {
    if (!contains(key)) {
        return;
    }

    int i = hash(key);

    while (!key.equals(keys[i])) {
        i = (i + 1) % M;
    }

    keys[i] = null;
    values[i] = null;
    i = (i + 1) % M;

    while (keys[i] != null) {
        Key keyToRehash = key[i];
        Value valueToRehash = values[i];

        keys[i] = null;
        values[i] = null;
        N--;

        put(keyToRehash, valueToRehash);
        i = (i + 1) % M;
    }

    N--;
    
    if(N > 0 && N <= M / 8) {
        resize(M / 2);
    }
}

public void resize(int capacity) {
    LinearProbingHashST<Key, Value> temp = new LinearProbingHashST<Key, Value>(capacity);

    for (int i = 0; i < M; i++) {
        if (keys[i] != null) {
            temp.put(keys[i], values[i]);
        }
    }

    keys = temp.keys;
    values = temp.values;
    M = temp.M;
}
```

## Separate Chaining

- The collision resolution: when keys hash to the same index, can also be handled by as follows:
  - Each bucket in the hash table is the head of a Linked List
  - All elements that hash to a particular bucket are placed on the bucket's Linked List
  - Records within a bucket can be ordered in several ways

## Hashing with separate chaining

```Java
public class SeparateChainingHashST<Key, Value> {
    
    private int N, M;
    private SequentialSearchST<Key, Value>[] storage;

    public SeparateChainingHashST() {
        this(997);
    }

    public SeparateChainingHashST(int pM) {
        this.M = pM;
        storage = (SequentialSearchST<Key, Value>) new SequentialSearchST[M];

        for (int i = 0; i < M; i++) {
            storage[i] = new SequentialSearchST<Key, Value>();
        }
    }

    private int hash(Key key) {
        return (key.hashCode() & 0x7ffffff) % M;
    }

    public Value get(Key key) {
        int i = hash(key);
        return storage[i].get(key);
    }

    public void put(Key key, Value val) {
        if (val == null) {
            delete(key);
            return;
        }

        if (N >= 10 * M) {
            resize(2 * M);
        }

        int i = hash(key);

        if (!storage[i].contains(key)) {
            N++;
        }

        storage[i].put(key, val);
    }
}
```

## Example: Structure of separate chaining

```Java
Key:   S E A R C H E X A M P L E
Hash:  2 0 0 4 4 4 0 2 0 4 3 3 0
```

![chaining](pictures/separate_chaining.png)

# 7. Tries <a name="seventh"> </a>

## String Symbol Table API

Alternative for hashing, when key type is String

```Java
interface StringSymbolTable<V> {
    void put(String key, V value);
    V get(String key);
    void delete(String key);
}
```

## Tries

- Store characteristics in Nodes (not keys)
- Each Node has array with max R children, one for each possible character in the alphabet

![trie](pictures/trie_example.png)

## Search in a Trie

- Search hit: Node where search ends has non-null value
  - `get("shells")` returns 3
  - `get("she")` return 0
- Search miss: Reach null link or node where search ends has null value
  - `get("shell")` returns null
  - `get("shelter")` returns null

## Insertion into a Trie

- Follow links corresponding to each character in the key
  - Encounter null link? Create new Node
  - Encounter last character of key? Set value in that Node

![trie insert](pictures/trie_insert.png)

## Deletion from a Trie

- Find Node corresponding to key and set value to null
- If Node has null value and all null links, remove that Node (and recur)

![trie delete](pictures/trie_delete.png)

## RWayTrie code

```Java
public class RWayTrie<V> implements StringSymbolTable<V> {
    
    private static class Node<T> {
        
        private T value;
        private final Node<T>[] next = new Node[R]
    }

    private static final int R = 256; // Size alphabet
    private Node<V> root = new Node<>();

    @Override
    public void put(String key, V value) {
        root = put(root, key, value, 0);
    }

    private Node<V> put(Node<V> node, String key, V value, int charIndex) {
        if (node == null) {
            node = new Node<>();
        }

        if(charIndex == key.length()) {
            node.value = value;
            return node;
        }

        char c = key.charAt(charIndex);
        node.next[c] = put(node.next[c], key, value, charIndex + 1);

        return node;
    }

    @Override
    public V get(String key) {
        Node<V> node = get(root, key, 0);

        if (node == null) {
            return null;
        } else {
            return node.value;
        }
    }

    private Node<V> get(Node<V> node, String key, int charIndex) {
        if (node == null) {
            return null;
        } 

        if (charIndex == key.length()) {
            return node;
        }

        char c = key.charAt(charIndex);
        return get(node.next[c], key, charIndex + 1);
    }

    @Override
    public void delete(String key) {
        root = delete(root, key, 0);
    }

    private Node<V> delete(Node<V> node, String key, int charIndex) {
        if (node == null) {
            return null;
        }

        // This if-else will traverse down to the key Node and
        // sets its value to null
        if (charIndex == key.length()) {
            node.value = null;
        } else {
            char c = key.charAt(charIndex);

            // The new sub-trie node.next[c] is the old one from which
            // the key-value pair is removed
            node.next[c] = delete(node.next[c], key, charIndex + 1);
        }

        // After the recursive call, 'traversal to root' again to clean up
        // unnecessary nodes
        if (node.value != null) {
            return node;
        }

        // If there is at least one sub-trie in this Node's array,
        // the node itself is returned
        for (char c = 0; c < R; c++) {
            if (node.next[c] != null) {
                return node;
            }
        }

        // If this code is reached, there is no sub-trie anymore an this
        // branch in the trie can be cut
        return null; 
    }
}
```

## Performance of R-way Trie

- Search hit: Examine all characters of key
- Search miss: Sometimes after examining first character, typically after a few
- Space inefficient: Many null links in each node

=> Wasting space; Only useful for small R 

## Improvement for big R: Ternary Trie

- Store characters in Nodes (not keys)
- Each Node has 3 children: smaller (left), equal (middle), larger (right)

![ternary](pictures/ternary_trie.png)

## Search in Ternary Trie

- Follow links corresponding to each character in the key
  - If less, take left link: If greater, take right link
  - If equal, take the middle link and move to the next key character
  - Search hit: Node where search ends has non-null value
  - Search miss: Reach a null link or node where search ends has null value

## TernaryTrie code

```Java
public class TernaryTree<V> implements StringSymbolTable<V> {

    private class Node {
        private V value;
        private char c;
        private Node left, mid, right;
    }

    private Node root;

    @Override
    public void put(String key, V value) {
        root = put(root, key, value, 0);
    }

    private Node put(Node node, String key, V value, int charIndex) {
        char c = key.charAt(charIndex);

        if (node == null) {
            node = new Node();
            node.c = c;
        }

        if (c < node.c) {
            node.left = put(node.left, key, value, charIndex);
        } else if (c > node.c) {
            node.right = put(node.right, key, value, charIndex);
        } else if (charIndex < key.length() - 1) {
            node.mid = put(node.mid, key, value, charIndex + 1);
        } else {
            node.value = value;
        }

        return node;
    }

    @Override
    public V get(String key) {
        Node node = get(root, key, 0);

        if (node == null) {
            return null;
        }

        return node.value;
    }

    private Node get(Node node, String key, int charIndex) {
        if (node == null) {
            return null;
        }

        char c = key.charAt(charIndex);

        if (c < node.c) {
            return get(node.left, key, charIndex);
        } else if (c > node.c) {
            return get(node.right, key, charIndex);
        } else if (charIndex < key.length() - 1) {
            return get(node.mid, key, charIndex + 1);
        } else {
            return node;
        }
    }
}
```

## Ternary Search Trie vs Hashing

- Hashing
  - Need to examine entire key
  - Search hit and miss cost about the same
  - Performance relies on hash-function
  - Does not support ordered symbol table operations
- Ternary Search Trie
  - Works only for String keys
  - Only examines just enough key characters
  - Search miss may involve only a few characters
  - Supports ordered symbol table operations

=> Ternary Search Tries can be faster than hashing (especially for search miss)