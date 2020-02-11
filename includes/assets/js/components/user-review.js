var Stats = require("./user-review/stats.js");
var Form = require("./user-review/form.js");
var ProsAndCons = require("./user-review/pros-and-cons.js");
var Reply = require("./user-review/reply.js");
var Edit = require("./user-review/edit.js");
var Voting = require("./user-review/voting.js");

var UserReview = {
    init: function() {
        Stats.init();
        Form.init();
        ProsAndCons.init();
        Reply.init();
        Edit.init();
        // Voting.init();

        this.eventListener();
        console.log("User Review Form JS Loaded !!!");
    },

    eventListener: function() {
        jQuery("a.woocommerce-scr-review-link").click(function() {
            jQuery(".scr-reviews_tab a").click();
            return true;
        });
    },
};

module.exports = UserReview;
