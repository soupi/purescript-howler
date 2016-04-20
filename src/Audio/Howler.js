"use strict";

// module Audio.Howler

exports.newHowl = function(props) {
    return function() {
	return new Howl(props);
    };
};

exports.playHowl = function(obj) {
    return function() {
        return obj.play();
    };
};

exports.stopHowl = function(obj) {
    return function() {
        obj.stop();
    };
};

exports.pauseHowl = function(obj) {
    return function() {
        obj.pause();
    };
};


exports.muteHowl = function(obj) {
    return function() {
        obj.mute();
    };
};


exports.unmuteHowl = function(obj) {
    return function() {
        obj.unmute();
    };
};

exports.fadeHowl = function(fade) {
    return function(obj) {
	return function() {
	    obj.fade(fade);
	};
    };
};

exports.loopHowl = function(loop) {
    return function(obj) {
	return function() {
	    obj.loop(loop);
	};
    };
};

exports.positionHowl = function(pos) {
    return function(obj) {
	return function() {
	    obj.pos(pos);
	};
    };
};

exports.volumeHowl = function(vol) {
    return function(obj) {
	return function() {
	    obj.volume(vol);
	};
    };
};

exports.volumeAll = function(vol) {
    return function(obj) {
	return function() {
	    Howler.volume(vol);
	};
    };
};

exports.muteAll = function() {
    return function() {
	Howler.mute();
    };
};

exports.unmuteAll = function() {
    return function() {
	Howler.unmute();
    };
};

