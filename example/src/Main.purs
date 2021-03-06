module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)

import Audio.Howler as Howl

main :: forall e. Eff (howler :: Howl.HOWLER, console :: CONSOLE | e) Unit
main = do
  sound <- Howl.new (Howl.defaultProps { urls = ["audio/gling.mp3"] })
  void $ Howl.play sound
  log "played"

