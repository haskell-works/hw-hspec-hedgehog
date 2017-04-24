{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.HSpec.HedgehogSpec (spec) where

import           HaskellWorks.HSpec.Hedgehog
import           Hedgehog
import           Test.Hspec

{-# ANN module ("HLint: ignore Redundant do"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.HUnit.HedgehogSpec" $ do
  it "should have require function that checks hedgehog properties" $ do
    require $ property $ 42 === 42
