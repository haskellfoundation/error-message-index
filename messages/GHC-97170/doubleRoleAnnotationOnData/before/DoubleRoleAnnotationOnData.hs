{-# LANGUAGE RoleAnnotations #-}
module DoubleRoleAnnotationOnData where

data Foo a = MkFoo a
type role Foo nominal
type role Foo representational
