module MultiConstructorComments where

data Maybe a =
      -- | The Nothing constructor signals the absence of a value.
      Nothing
      -- ^ You can use the Nothing constructor where you would use `null` in other languages.
    | Just a

