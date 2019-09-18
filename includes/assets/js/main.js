var UserReviewsList = require("./components/user-reviews-list.js");
var Stats = require("./components/stats.js");
var Form = require("./components/form.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");
var ReviewsList = require("./components/reviews-list.js");

var HelpieReviews = {
    init: function() {
        Stats.init();
        Form.init();
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
import { format } from "url";
