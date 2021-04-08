# Exam 3
4/5/21 - 4/10/21



## Weeks 9 - 11
**Topics**:
- Week 9
  - 1. Queue
  - 2. Tree and Binary Tree
- Week 10
  - 1. Tree Traversal
  - 2. Binary Search Tree
- Week 11
  - 1. Hashtable
  - 2. Hashtable

Solve a collision resolution problem w/ **open addressing**, including **linear probing**, **quadratic probing**, and **double hashing**

- *Pay attention to slides 9 - 23 in Lecture 16*


### Table Operations
- **Insert**: make sure that the table does not contain another object w/ the same key 
- **Find/Access**: retrieve the object in the table corresponding to a particular key
- **Remove**: delete the object in the table that corresponds to a given key


### Table Implementation: Unsorted Linked List
- **Insert**: $O(1)$
- **Access**: $O(n)$
- **Remove**: $O(n)$
- Find minimum - maximum: $O(n)$

---

### Collision Resolution

1. Seperate Chaining
2. Open Addressing

#### Seperate Chaining

#### Open Addressing

- all elements are stored in the hash table
- when collision occurs, follow a consistent procedure to store the elements in free slots in the table

**Open Addressing**

**Probing**: the sequence of locations examined when locating address
**Probe Sequence**: described as the following,

$h(k, i) = (h(k) + p(i)) mod N$

- $h(k)$ is the *hash code map* function
- $p(i)$ is a probing function
- N is the array (table) size
- i starts at 0 and $h(k, i)$ is the array index that will be examined
- If the array index $h(k, i)$ is occupied, i is increased by 1 and we need to calculate a new $h(k, i)$ until,
- If the array index $h(k, i)$ is free, we found the location to insert data

##### Common Open Addressing Methods

1. Linear Probing
2. Quadratic Probing
3. Double Hashing

**Linear Probing**

$h(k, i) = (h(k)+i) mod N$

- In linear probing, collisions are resolved by sequentially scanning an array (w/ wraparound) until an empty cell is found

**Linear Probing: Clustering Issue**
- The position of the initial mapping $h(k, 0)$ of key *k* is called the **home position** of *k*
- When several insertions map to the same home position, they end up placed continguously in the table. This collection of keys w/ the same home position is called a **cluster**
- As these clusters grow, they merge with other clusters forming even bigger clusters which grow even faster
- Cluster, especially larger clusters can increase the number of probe operatiobs, thereby increasing the time of complexity of the hash table

**Quadratic Probing**

- $p(i) = i^2 (0<=i<N)$
- As in linear probing, the proe sequence starts at $h(k)$.
- Unlike linear probing, it examines the cells 1, 4, 9, and so on, away from the original probe point

$h(k, i) = (h(k) + i^2) mod N

Quadratic probing eliminates the primary clustering problem by examining certain cells away from the original probe point

**Double Hashing**
- Quadratic probing solves the primary lustering problem, but it has the secondary clustering problem, in which, elements that hash to the same position probe the same alternative cells
- Double hashing is a hashing technique that does not suffer from xecondary clustering. A second hash function is used to drive the collision resolution

- **Double Hashing Example**


**Deletion in Open Addressing**


### Summary of Data Structures
- **Low level data structures**
  - Regular array
  - Linked list
  - Binary search tree
  - Hash table
- **High level data structure**
  - Stack:
    - sequence container, ... push, pop
  - Queue:
    - sequence container, FIFO: enqueue, dequeue
  - Set:
    - associative  container that contains unique objects
    - insert, erase, find
  - Map: (table / dictionary)
    - associative container
    - Store objects that contain keysand values