var UserReviewsList = require("./user-reviews-list.js");
var ListControl = require("./blocks/list-control.js");
var Dropdown = require("./blocks/dropdown.js");

var HelpieReviews = {
    init: function() {
        UserReviewsList.init();
        ListControl.init();
        Dropdown.init();
    },

    eventHandlers: function() {
        var thisModule = this;
    }
};

jQuery(document).ready(function() {
    HelpieReviews.init();
});

import "./../style.scss";
