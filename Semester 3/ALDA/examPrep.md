# 1. ALDA_Introduction

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

# 2. DataStructures_1

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