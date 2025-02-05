module DifferentRoles where

data D a

-- .hs-boot or .hsig boot
{-# LANGUAGE RoleAnnotations #-}
module DifferentRoles where

type role D phantom
data D a
