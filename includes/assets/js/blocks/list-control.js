// import List from "list.js";
var List = require("list.js");

var UserReviewsList = {
    init: function() {
        var options = {
            // item: "hrp-collection__col",
            valueNames: ["review-card__header", "review-card__body"],
            fuzzySearch: {
                searchClass: "collection-search",
                location: 0,
                distance: 100,
                threshold: 0.4,
                multiSearch: true
            }
        };

        this.featureList = new List("hrp-controlled-list", options);
        this.eventHandlers();
        console.log("ListControl");
    },

    eventHandlers: function() {
        console.log("ListControl eventHandlers");
        // this.filters();
    },

    filters: function() {
        var thisModule = this;
        jQuery("#filter-games").click(function() {
            thisModule.featureList.filter(function(item) {
                if (item.values().category == "Game") {
                    return true;
                } else {
                    return false;
                }
            });
            return false;
        });

        jQuery("#filter-beverages").click(function() {
            thisModule.featureList.filter(function(item) {
                if (item.values().category == "Beverage") {
                    return true;
                } else {
                    return false;
                }
            });
            return false;
        });
        jQuery("#filter-none").click(function() {
            thisModule.featureList.filter();
            return false;
        });
    },

    sorting: function() {}
};

module.exports = UserReviewsList;
