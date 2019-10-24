var Stats = require("./user-review/stats.js");
var Form = require("./user-review/form.js");
var ProsAndCons = require("./user-review/pros-and-cons.js");

var UserReview = {
    init: function() {
        Stats.init();
        Form.init();
        ProsAndCons.init();

        this.eventListener();
        console.log("User Review Form JS Loaded !!!");
    },

    eventListener: function() {}
};

module.exports = UserReview;
