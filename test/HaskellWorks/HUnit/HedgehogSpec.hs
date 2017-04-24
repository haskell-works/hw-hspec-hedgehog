{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.HUnit.HedgehogSpec (spec) where

import           Test.Hspec

{-# ANN module ("HLint: ignore Redundant do"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.HUnit.HedgehogSpec" $ do
  it "stub" $ do
    True `shouldBe` True
