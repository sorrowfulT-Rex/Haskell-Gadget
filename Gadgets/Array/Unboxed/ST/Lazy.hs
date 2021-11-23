{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Gadgets.Array.Unboxed.ST.Lazy where

import           Control.Monad.ST.Lazy (ST)
import           Data.Array.Unboxed (IArray, UArray)
import qualified Data.Array.ST as A
import qualified Data.Array.Unsafe as A
import qualified Gadgets.Array.Unboxed as A

type STUArray = A.STUArray
type MArray   = A.MArray

-- | Making an array from a list, indexed from 0.
fromList :: (IArray UArray e, MArray (STUArray s) e (ST s))
         => [e]
         -> ST s (STUArray s Int e)
fromList = thaw . A.fromList

-- | This is the same as the default @freeze@ function, but it has specified
-- type to avoid explicit signature binding.
freeze :: (IArray UArray a, MArray (STUArray s) a (ST s))
       => STUArray s Int a
       -> ST s (UArray Int a)
freeze = A.freeze

-- | This is the same as the default @thaw@ function, but it has specified type
-- to avoid explicit signature binding.
thaw :: (IArray UArray a, MArray (STUArray s) a (ST s))
     => UArray Int a
     -> ST s (STUArray s Int a)
thaw = A.thaw

-- | This is the same as the default @unsafeFreeze@ function, but it has
-- specified type to avoid explicit signature binding.
unsafeFreeze :: (IArray UArray a, MArray (STUArray s) a (ST s))
             => STUArray s Int a
             -> ST s (UArray Int a)
unsafeFreeze = A.unsafeFreeze

-- | This is the same as the default @unsafeThaw@ function, but it has specified
-- type to avoid explicit signature binding.
unsafeThaw :: (IArray UArray a, MArray (STUArray s) a (ST s))
           => UArray Int a
           -> ST s (STUArray s Int a)
unsafeThaw = A.unsafeThaw
