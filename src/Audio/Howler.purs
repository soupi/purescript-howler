-- | A subset of the howler.js API. play sounds in your browser with ease!

module Audio.Howler
    ( HOWLER
    , Howl
    , Props
    , Fade
    , new
    , play
    , stop
    , pause
    , mute
    , unmute
--    , fade
    , loop
    , setVolume
    , setCursorPosition
--    , fadeIn
--    , fadeOut
    , defaultProps
    ) where

import Prelude (Unit)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Control.Monad.Eff (Eff)

-- | An effect type for Howler
foreign import data HOWLER :: !

-- | A type for howler objects. these are pointers for mutable sound objects
-- | Apply a function on them to change them.
foreign import data Howl :: *

foreign import muteAll   :: forall e. Eff (howler :: HOWLER | e) Unit
foreign import unmuteAll :: forall e. Eff (howler :: HOWLER | e) Unit
foreign import volumeAll :: forall e. Number -> Eff (howler :: HOWLER | e) Unit

foreign import newHowl      :: forall e. JSProps -> Eff (howler :: HOWLER | e) Howl
foreign import playHowl     :: forall e. Howl    -> Eff (howler :: HOWLER | e) Unit
foreign import stopHowl     :: forall e. Howl    -> Eff (howler :: HOWLER | e) Unit
foreign import pauseHowl    :: forall e. Howl    -> Eff (howler :: HOWLER | e) Unit
foreign import muteHowl     :: forall e. Howl    -> Eff (howler :: HOWLER | e) Unit
foreign import unmuteHowl   :: forall e. Howl    -> Eff (howler :: HOWLER | e) Unit
foreign import fadeHowl     :: forall e. Fade    -> Howl -> Eff (howler :: HOWLER | e) Unit
foreign import loopHowl     :: forall e. Boolean -> Howl -> Eff (howler :: HOWLER | e) Unit
foreign import positionHowl :: forall e. Number  -> Howl -> Eff (howler :: HOWLER | e) Unit
foreign import volumeHowl   :: forall e. Number  -> Howl -> Eff (howler :: HOWLER | e) Unit

type JSProps =
  { urls     :: Array String
  , format   :: Nullable String
  , autoplay :: Boolean
  , buffer   :: Boolean
  , loop     :: Boolean
  , volume   :: Number
  , rate     :: Number
  }


-- | Properties for a Howl object
-- | * `urls` - State the path of sound resources. for example: ["sound1.mp3","sound2.ogg" ]. This is required.
-- | * `format` - State the format of the resource you want to play. this is optional
-- | * `volume` - Control the volume of the sound. between 0.0 and 1.0. default is 1.0
-- | * `rate` - Speed of playback. default is 1.0 which is normal speed. negative values will play resource in reverse
-- | * `autoplay` - Start playing when the sound resource is loaded. this is optional
-- | * `loop` - Automatically play again the sound resource went it finish playing. default is false
-- | * `buffer` - Force HTML5 Audio. default is false.
type Props =
  { urls     :: Array String
  , format   :: Maybe String
  , volume   :: Number
  , rate     :: Number
  , autoplay :: Boolean
  , loop     :: Boolean
  , buffer   :: Boolean
  }

-- | Default properties for your convenience. values are stated in Props doc.
-- | Please override 'urls' with your requested sound resource paths
defaultProps :: Props
defaultProps =
  { urls: []
  , format: Nothing
  , volume: 1.0
  , rate: 1.0
  , autoplay: false
  , loop: false
  , buffer: false
  }


-- | Fade style
-- | * `from` - Start volume level. from 0.0 to 1.0
-- | * `to` - End volume level. from 0.0 to 1.0
-- | * `duration` - How long to transition from 'from' to 'to' in miliseconds
type Fade =
  { from     :: Number
  , to       :: Number
  , duration :: Number
  }

{-
--   Simple fade-in with 1 second delay
fadeIn :: Fade
fadeIn =
  { from: 0.0
  , to: 1.0
  , duration: 1000.0
  }

--   Simple fade-out with 1 second delay
fadeOut :: Fade
fadeOut =
  { from: 1.0
  , to: 0.0
  , duration: 1000.0
  }
-}

-- | Create a new Howl object
new :: forall e. Props -> Eff (howler :: HOWLER | e) Howl
new props = newHowl props { format = toNullable props.format }

-- | Play sound resource
play :: forall e. Howl -> Eff (howler :: HOWLER | e) Unit
play = playHowl

-- | Stop playing sound resource
stop :: forall e. Howl -> Eff (howler :: HOWLER | e) Unit
stop = stopHowl

-- | Pause sound resource
pause :: forall e. Howl -> Eff (howler :: HOWLER | e) Unit
pause = pauseHowl

-- | Mute sound resource
mute :: forall e. Howl -> Eff (howler :: HOWLER | e) Unit
mute = muteHowl

-- | Unmute sound resource
unmute :: forall e. Howl -> Eff (howler :: HOWLER | e) Unit
unmute = unmuteHowl

--   Fade sound resource
-- fade :: forall e. Fade -> Howl -> Eff (howler :: HOWLER | e) Unit
-- fade = fadeHowl

-- | Set loop property of sound resource
loop :: forall e. Boolean -> Howl -> Eff (howler :: HOWLER | e) Unit
loop = loopHowl

-- | Set volume property of sound resource. from 0.0 to 1.0
setVolume :: forall e. Number -> Howl -> Eff (howler :: HOWLER | e) Unit
setVolume = volumeHowl

-- | Set cursor position of playback
setCursorPosition :: forall e. Number -> Howl -> Eff (howler :: HOWLER | e) Unit
setCursorPosition = positionHowl


