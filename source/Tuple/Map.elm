module Tuple.Map where
{-| Just a few convenient functions for mapping over pairs.

@docs mapLeft, mapRight, mapEach, mapEach2, mapBoth, mapBoth2, map, map2
-}

{-| Map over the tuple with two functions, one for each
element.
-}
mapEach : (a -> a') -> (b -> b') -> (a, b) -> (a', b')
mapEach f g (a, b) = (f a, g b)

{-| Map over two tuples with two functions, one for first elements 
and the other for second elements.
-}
mapEach2 : (a -> a' -> a'') -> (b -> b' -> b'') -> (a, b) -> (a', b') 
   -> (a'', b'')
mapEach2 f g (a, b) (c, d) = (f a c, g b d)

{-| Apply the given function to both elements of the tuple.
-}
mapBoth : (a -> a') -> (a, a) -> (a', a')
mapBoth f = mapEach f f

{-| Apply the given function to both elements of both tuples.
-}
mapBoth2 : (a -> a' -> a'') -> (a, a) -> (a', a') -> (a'', a'')
mapBoth2 f = mapEach2 f f

{-| Synonym for `mapBoth`.
-}
map : (a -> a') -> (a, a) -> (a', a')
map = mapBoth

{-| Synonym for `mapBoth2`.
-}
map2 : (a -> a' -> a'') -> (a, a) -> (a', a') -> (a'', a'')
map2 = mapBoth2

{-| Apply the given function to the left element, leaving the
right unchanged.
-}
mapLeft : (a -> a') -> (a, b) -> (a', b)
mapLeft f = mapEach f identity

{-| Apply the given function to the right element, leaving the
left unchanged.
-}
mapRight : (b -> b') -> (a, b) -> (a, b')
mapRight g = mapEach identity g
