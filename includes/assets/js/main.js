var UserReviewsList = require("./components/user-reviews-list.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");
var ReviewsList = require("./components/reviews-list.js");

var HelpieReviews = {
    init: function() {
        UserReviewsList.init();
        ListControl.init();
        ReviewsList.init();
    },

    eventHandlers: function() {
        var thisModule = this;
    }
};

jQuery(document).ready(function() {
    HelpieReviews.init();
});

import "./../style.scss";
