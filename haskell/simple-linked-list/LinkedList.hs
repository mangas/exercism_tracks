module LinkedList( new, isNil, nil, fromList, toList, datum, next, reverseLinkedList ) where

import Debug.Trace

data List a = Node a (List a) | NoNode deriving (Eq, Show)

nil :: List a
nil = NoNode

isNil :: List a -> Bool
isNil NoNode = True
isNil _ = False

new :: a -> List a -> List a
new = Node

fromList :: [a] -> List a
fromList = foldr Node nil

toList :: List a -> [a]
toList NoNode = []
toList (Node x n) = x: toList n

datum :: List a -> a
datum (Node a _) = a

next :: List a -> List a
next NoNode = NoNode
next (Node _ n) = n

reverseLinkedList :: List a -> List a
reverseLinkedList NoNode = NoNode
reverseLinkedList n@(Node x NoNode) = n
reverseLinkedList n = LinkedList.reverse NoNode n

reverse :: List a -> List a -> List a
reverse first NoNode = first
reverse NoNode (Node x (Node x1 n)) = LinkedList.reverse (Node x1 (Node x NoNode)) n
reverse first (Node x n) = LinkedList.reverse (Node x first) n