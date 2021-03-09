var Stats = require("./user-review/stats.js");
var Form = require("./user-review/form.js");
var ProsAndCons = require("./user-review/pros-and-cons.js");
var Reply = require("./user-review/reply.js");
var Edit = require("./user-review/edit.js");
var Voting = require("./user-review/voting.js");

var UserReview = {
    init: function () {
        this.removeDuplicateForms();
        Stats.init();
        Form.init();
        ProsAndCons.init();
        Reply.init();
        Edit.init();
        Voting.init();

        this.eventListener();
        console.log("User Review Form JS Loaded !!!");
    },

    eventListener: function () {
        jQuery("a.woocommerce-scr-review-link").click(function () {
            jQuery(".scr-reviews_tab a").click();
            return true;
        });
    },

    removeDuplicateForms: function () {
        var noOfForms = jQuery("form.scr-user-review").length;
        if (noOfForms <= 1) {
            return;
        }
        var increment = 0;
        jQuery("form.scr-user-review").each(function () {
            if (increment > 0) {
                jQuery(this).remove();
            }
            increment++;
        });
    },
};

module.exports = UserReview;
