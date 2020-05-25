var UserReview = require("./components/user-review.js");
var ListBuilder = require("./list-builder.js");
// var ListControl = require("./blocks/list-control.js");
var ReviewsList = require("./components/reviews-list.js");
var PhotoReviews = require("./components/photo-reviews/photo-reviews.js");
var ComparisonTable = require("./comparison-table.js");
var UserReviewsList = require("./components/user-reviews-list.js");

var StarcatReview = {
    init: function () {
        UserReview.init();
        ListBuilder.init();
        PhotoReviews.init();
        // ListControl.init();
        // ComparisonTable.init();        
    },

    eventHandlers: function () {
        var thisModule = this;
    },
};

jQuery(document).ready(function () {
    StarcatReview.init();
});

import "./../style.scss";
// import { format } from "url"; import { monitorEventLoopDelay } from "perf_hooks";

