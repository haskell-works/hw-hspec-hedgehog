{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Hspec.HedgehogSpec (spec) where

import           HaskellWorks.Hspec.Hedgehog
import           Hedgehog
import           Test.Hspec

import qualified Hedgehog.Gen                as Gen
import qualified Hedgehog.Range              as Range

{-# ANN module ("HLint: ignore Redundant do"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.Hspec.HedgehogSpec" $ do
  it "should have require function that checks hedgehog properties" $ do
    require $ property $ do
      x <- forAll (Gen.int Range.constantBounded)
      x === x
