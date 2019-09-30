var UserReview = require("./components/user-review.js");
var ListControl = require("./blocks/list-control.js");
var ReviewsList = require("./components/reviews-list.js");
var ComparisonTable = require("./comparison-table.js");
var UserReviewsList = require("./components/user-reviews-list.js");

var HelpieReviews = {
    init: function() {
        UserReview.init();
        ListControl.init();
        Comparison.init();
    },

    eventHandlers: function() {
        var thisModule = this;
    }
};

jQuery(document).ready(function() {
    HelpieReviews.init();
});

import "./../style.scss";
import { format } from "url";
