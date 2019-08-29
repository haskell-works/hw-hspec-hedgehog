{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Hspec.Hedgehog
  ( require
  , requireProperty
  , requireTest
  ) where

import Control.Monad          (unless)
import Control.Monad.IO.Class
import Data.CallStack
import Hedgehog
import Test.HUnit.Lang

import qualified Control.Exception as E

location :: HasCallStack => Maybe SrcLoc
location = case reverse callStack of
  (_, loc) : _ -> Just loc
  []           -> Nothing

require :: HasCallStack => Property -> Assertion
require p = do
  result <- liftIO $ check p
  unless result $
    E.throwIO (HUnitFailure location $ Reason "Hedgehog property test failed")

requireProperty :: HasCallStack => PropertyT IO () -> Assertion
requireProperty = require . property

requireTest :: HasCallStack => PropertyT IO () -> Assertion
requireTest = require . withTests 1 . property
