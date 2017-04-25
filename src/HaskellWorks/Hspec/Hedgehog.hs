{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Hspec.Hedgehog
  ( require
  , requireProperty
  ) where

import           Hedgehog

import qualified Control.Exception      as E
import           Control.Monad          (unless)
import           Control.Monad.IO.Class
import           Data.CallStack
import           Test.HUnit.Lang

location :: HasCallStack => Maybe SrcLoc
location = case reverse callStack of
  (_, loc) : _ -> Just loc
  []           -> Nothing

require :: HasCallStack => Property -> Assertion
require p = do
  result <- liftIO $ check $ p
  unless result $ do
    (E.throwIO (HUnitFailure location $ Reason "Hedgehog property test failed"))

requireProperty :: Test IO () -> Assertion
requireProperty = require . property
