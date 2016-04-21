<a href="https://pursuit.purescript.org/packages/purescript-howler">
  <img src="https://pursuit.purescript.org/packages/purescript-howler/badge"
    alt="purescript-howler on Pursuit">
  </img>
</a>


purescript-howler
-----------------

Binding for a subset of [howlerjs](http://howlerjs.com/)

> Status: Experimental

> License: MIT

You'll need to download howlerjs and include it as a script in your index.html (or use CDN)

## Example

```purs
module Main where

import Prelude (bind, Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)

import Audio.Howler as Howl

main :: forall e. Eff (howler :: Howl.HOWLER, console :: CONSOLE | e) Unit
main = do
  sound <- Howl.new (Howl.defaultProps { urls = ["audio/gling.mp3"] })
  Howl.play sound
  log "playing"

```

[Link to API Documentation](https://pursuit.purescript.org/packages/purescript-howler/)
