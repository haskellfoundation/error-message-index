module MultiConstructorComments where

data Maybe a =
      -- | The Nothing constructor signals the absence of a value.
      -- You can use the Nothing constructor where you would use `null` in other languages.
      Nothing
    | Just a
