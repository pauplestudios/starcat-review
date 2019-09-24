// import List from "list.js";
var List = require("list.js");

var UserReviewsList = {
    init: function() {
        this.dropDownInit();

        var options = {
            // item: "hrp-collection__col",
            valueNames: [
                "review-card__header",
                "review-card__body",
                { name: "reviewCount", attr: "data-reviewcount" }
            ],

            page: 10,
            pagination: true,
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

        jQuery(".pagination a").addClass("item");
        // console.log("ListControl");
    },

    dropDownInit: function() {
        var thisModule = this;

        jQuery("#hrp-controlled-list .ui.dropdown").dropdown({
            clearable: true
        });
    },

    eventHandlers: function() {
        // console.log("ListControl eventHandlers");
        this.filters();
        this.sorting();
    },

    checkExists: function(selector) {
        console.log(jQuery(selector).length);
    },

    filters: function() {
        var thisModule = this;

        jQuery("#hrp-controlled-list .ui.dropdown.reviews").dropdown(
            "setting",
            "onChange",
            function(value, text, $selectedItem) {
                // console.log("clicked: " + value);

                if (value == "") {
                    thisModule.featureList.clear();
                }

                thisModule.featureList.filter(function(item) {
                    // console.log(item.values());
                    if (item.values().reviewCount == value) {
                        return true;
                    } else {
                        return false;
                    }
                });
            }
        );
    },

    sorting: function() {
        var thisModule = this;

        jQuery("#hrp-controlled-list .ui.dropdown.sort").dropdown(
            "setting",
            "onChange",
            function(value, text, $selectedItem) {
                console.log("clicked: " + value);

                if (value == "alphabet-asc") {
                    thisModule.featureList.sort("review-card__header", {
                        order: "asc"
                    });
                } else if (value == "alphabet-desc") {
                    thisModule.featureList.sort("review-card__header", {
                        order: "desc"
                    });
                } else if (value == "review-count") {
                    thisModule.featureList.sort("reviewCount", {
                        order: "desc"
                    });
                }
            }
        );
    }
};

module.exports = UserReviewsList;
