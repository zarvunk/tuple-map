module Tuple.Map where
{-| Just a few convenient functions for mapping over pairs.

@docs mapLeft, mapRight, mapEach, mapBoth, map
-}

{-| Map over the tuple with two functions, one for each
element.
-}
mapEach : (a -> a') -> (b -> b') -> (a, b) -> (a', b')
mapEach f g (a, b) = (f a, g b)

{-| Apply the given function to both elements of the tuple.
-}
mapBoth : (a -> a') -> (a, a) -> (a', a')
mapBoth f = mapEach f f

{-| Synonym for `mapBoth`.
-}
map : (a -> a') -> (a, a) -> (a', a')
map = mapBoth

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
