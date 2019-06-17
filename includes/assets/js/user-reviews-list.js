// import List from "list.js";
var List = require("list.js");
var Dropdown = require("./blocks/dropdown.js");

var UserReviewsList = {
    init: function() {
        /* init Dropdown from Semantic */
        // Dropdown.init();

        var options = {
            valueNames: ["title", "content"],
            fuzzySearch: {
                searchClass: "search",
                location: 0,
                distance: 100,
                threshold: 0.4,
                multiSearch: true
            }
        };

        this.featureList = new List("lovely-things-list", options);

        this.eventHandlers();
    },

    dropDownInit: function() {
        var thisModule = this;

        jQuery(".ui.dropdown").dropdown({
            clearable: true
        });
    },

    eventHandlers: function() {
        console.log("UserReviewsList eventHandlers");
        // this.featureList.filter();
        this.filters();
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
