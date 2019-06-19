var UserReviewsList = require("./components/user-reviews-list.js");
var ListControl = require("./blocks/list-control.js");

var HelpieReviews = {
    init: function() {
        UserReviewsList.init();
        ListControl.init();
    },

    eventHandlers: function() {
        var thisModule = this;
    }
};

jQuery(document).ready(function() {
    HelpieReviews.init();
});

import "./../style.scss";
