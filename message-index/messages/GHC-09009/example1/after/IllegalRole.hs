{-# LANGUAGE RoleAnnotations #-}

module IllegalRole where

type role A phantom
data A a = A