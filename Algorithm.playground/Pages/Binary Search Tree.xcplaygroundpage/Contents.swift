/*:
 # Binary Search Tree
 
 Binary search trees (BST), sometimes called ordered or sorted binary trees, are a particular type of container: a data structure that stores "items" (such as numbers, names etc.) in memory. They allow fast lookup, addition and removal of items, and can be used to implement either dynamic sets of items, or lookup tables that allow finding an item by its key.
 
 Binary search trees are a fundamental data structure used to construct more abstract data structures such as sets, multisets, and associative arrays.
 
 - When inserting or searching for an element in a binary search tree, the key of each visited node has to be compared with the key of the element to be inserted or found.
 - The shape of the binary search tree depends entirely on the order of insertions and deletions, and can become degenerate.
 - After a long intermixed sequence of random insertion and deletion, the expected height of the tree approaches square root of the number of keys, √n, which grows much faster than log n.
 - There has been a lot of research to prevent degeneration of the tree resulting in worst case time complexity of O(n) (for details see section Types).
 
 Binary search trees support three main operations: insertion of elements, deletion of elements, and lookup (checking whether a key is present).
 */
