var UserReviewsList = require("./components/user-reviews-list.js");
var Ratings = require("./components/ratings.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");

var HelpieReviews = {
    init: function() {
        UserReviewsList.init();
        Ratings.init();
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
