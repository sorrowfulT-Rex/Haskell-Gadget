{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Gadgets.Instance.Monoid where

instance {-# OVERLAPPABLE #-} (Num a) => Semigroup a where
  (<>) = mappend

instance {-# OVERLAPPABLE #-} (Num a) => Monoid a where
  mempty  = 0
  mappend = (+)