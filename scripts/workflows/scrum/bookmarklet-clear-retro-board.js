javascript:(
    (function() {
        'use strict';

        var oldConfirm = window.confirm;
        
        window.confirm = function (e) {
            return true;
        };

        var stickies = $('.sticky');

        for (var i = 0; i < stickies.length; i++) {
            stickies[i].click();
            $('.removeStickyButton').click();
        }

        window.confirm = oldConfirm;
    })()
);
