module Main where

import Prelude (pure, bind, unit, Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)

import Audio.Howler as Howl

-- main :: forall e. Eff (howler :: Howl.HOWLER | e) Unit
main :: forall e. Eff (howler :: Howl.HOWLER, console :: CONSOLE | e) Unit
main = do
  sound <- Howl.new (Howl.defaultProps { urls = ["audio/gling.mp3"] })
  Howl.play sound
  log "played"
  pure unit
  
