var Stats = require("./user-review/stats.js");
var Submission = require("./user-review/submission.js");
var ProsAndCons = require("./user-review/pros-and-cons.js");

var UserReview = {
    init: function() {
        Stats.init();
        Submission.init();
        ProsAndCons.init();

        this.eventListener();
        console.log("User Review Form JS Loaded !!!");
    },

    eventListener: function() {}
};

module.exports = UserReview;
