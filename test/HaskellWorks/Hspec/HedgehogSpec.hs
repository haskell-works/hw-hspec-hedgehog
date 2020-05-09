{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Hspec.HedgehogSpec (spec) where

import Data.CallStack
import HaskellWorks.Hspec.Hedgehog
import Hedgehog
import Test.Hspec
import Test.HUnit.Lang

import qualified Hedgehog.Gen   as Gen
import qualified Hedgehog.Range as Range

{- HLINT ignore "Redundant do"        -}

spec :: Spec
spec = describe "HaskellWorks.Hspec.HedgehogSpec" $ do
  it "should have require function that checks hedgehog properties" $ do
    require $ property $ do
      x <- forAll (Gen.int Range.constantBounded)
      x === x

  it "`require . property` should print a callstack with the test's location when property fails" $
    require (property failure) `shouldThrow` \(HUnitFailure srcLocMaybe _) ->
      fmap srcLocModule srcLocMaybe == Just "HaskellWorks.Hspec.HedgehogSpec"

  it "`requireProperty` should print a callstack with the test's location when property fails" $
    requireProperty failure `shouldThrow` \(HUnitFailure srcLocMaybe _) ->
      fmap srcLocModule srcLocMaybe == Just "HaskellWorks.Hspec.HedgehogSpec"

  it "`requireTest` should print a callstack with the test's location when property fails" $
    requireTest failure `shouldThrow` \(HUnitFailure srcLocMaybe _) ->
      fmap srcLocModule srcLocMaybe == Just "HaskellWorks.Hspec.HedgehogSpec"
