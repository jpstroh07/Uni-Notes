# Table of Contents
1. [Recursion and Tree traversal](#first)
2. [Intro into Sorters](#second)

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