var UserReviewsList = require("./components/user-reviews-list.js");
var Ratings = require("./components/ratings.js");
var Form = require("./components/form.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");

var HelpieReviews = {
    init: function() {
        UserReviewsList.init();
        Ratings.init();
        Form.init();
        ListControl.init();
    },

    eventHandlers: function() {
        var thisModule = this;
    }
};

jQuery(document).ready(function() {
    HelpieReviews.init();
});

import "./../style.scss";import { format } from "url";

