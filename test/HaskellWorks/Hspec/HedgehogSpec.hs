{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Hspec.HedgehogSpec (spec) where

import           HaskellWorks.Hspec.Hedgehog
import           Hedgehog
import           Test.Hspec

{-# ANN module ("HLint: ignore Redundant do"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.Hspec.HedgehogSpec" $ do
  it "should have require function that checks hedgehog properties" $ do
    require $ property $ 42 === 42
