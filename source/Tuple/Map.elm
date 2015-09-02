module Tuple.Map where

mapEach : (a -> a') -> (b -> b') -> (a, b) -> (a', b')
mapEach f g (a, b) = (f a, g b)

mapBoth : (a -> a') -> (a, a) -> (a', a')
mapBoth f = mapEach f f

mapLeft : (a -> a') -> (a, b) -> (a', b)
mapLeft f = mapEach f identity

mapRight : (b -> b') -> (a, b) -> (a, b')
mapRight g = mapEach identity g
