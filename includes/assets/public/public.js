var UserReview = require("./../public/js/components/user-review.js");
// var ListBuilder = require("./list-builder.js");
var ListBuilder = require("./../public/js/list-builder.js");
// var ListControl = require("./blocks/list-control.js");
var ReviewsList = require("./../public/js/components/reviews-list.js");
var PhotoReviews = require("./../public/js/components/photo-reviews/photo-reviews.js");
var ComparisonTable = require("./../public/js/comparison-table.js");
var UserReviewsList = require("./../public/js/components/user-reviews-list.js");

var StarcatReview = {
    init: function () {
        UserReview.init();
        ListBuilder.init();
        PhotoReviews.init();
        // ListControl.init();
        // ComparisonTable.init();  
        this.eventHandlers();
    },

    eventHandlers: function () {

        // Refreshing PhotoReviews events for paginated List items
        jQuery(".scr-pagination li").one("click", function (e) {
            PhotoReviews.init();
        });
    },
};

jQuery(document).ready(function () {
    StarcatReview.init();
});

import "./../public/public.scss";

