// import List from "list.js";
var List = require("list.js");

var UserReviewsList = {
    init: function(list_config) {
        console.log("List-Control JS");
        console.log(list_config.pagination);

        this.dropDownInit();

        var options = {
            // item: "scr-collection__col",
            valueNames: [
                "review-card__header",
                "review-card__body",
                { name: "reviewCount", attr: "data-reviewCount" },
                { name: "postDate", attr: "data-postDate" },
                { name: "postModified", attr: "data-postModified" },
                { name: "trendScore", attr: "data-trendScore" },
                { name: "positiveScore", attr: "data-positiveScore" },
            ],

            page: list_config.page ? list_config.page : 10,
            pagination: list_config.pagination ? list_config.pagination : true,
            fuzzySearch: {
                searchClass: "collection-search",
                location: 0,
                distance: 100,
                threshold: 0.4,
                multiSearch: true,
            },
        };

        console.log(options);

        this.featureList = new List("scr-controlled-list", options);
        this.eventHandlers();

        jQuery(".pagination a").addClass("item");
        // console.log("ListControl");
    },

    dropDownInit: function() {
        var thisModule = this;

        jQuery("#scr-controlled-list .ui.dropdown").dropdownX({
            // clearable: true,
        });
    },

    eventHandlers: function() {
        // console.log("ListControl eventHandlers");
        // this.filters();
        this.sorting();
    },

    checkExists: function(selector) {
        console.log(jQuery(selector).length);
    },

    filters: function() {
        var thisModule = this;
        console.log("filters()");
        jQuery("#scr-controlled-list .ui.dropdown").click(function() {
            console.log("clicked event: ");
        });
        jQuery("#scr-controlled-list .ui.dropdown").dropdownX(
            "setting",
            "onChange",
            function(value, text, selectedItem) {
                console.log("clicked: " + value);

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

        console.log("sorting()");
        jQuery("#scr-controlled-list .ui.dropdown.sort").dropdownX(
            "setting",
            "onChange",
            function(value, text, $selectedItem) {
                console.log("clicked: " + value);

                if (value == "alphabet-asc") {
                    thisModule.featureList.sort("review-card__header", {
                        order: "asc",
                    });
                } else if (value == "alphabet-desc") {
                    thisModule.featureList.sort("review-card__header", {
                        order: "desc",
                    });
                } else if (value == "review-count") {
                    thisModule.featureList.sort("reviewCount", {
                        order: "desc",
                    });
                } else if (value == "trending") {
                    thisModule.featureList.sort("trendScore", {
                        order: "desc",
                    });
                } else if (value == "post-date") {
                    thisModule.featureList.sort("postDate", {
                        order: "desc",
                    });
                } else if (value == "post-modified") {
                    thisModule.featureList.sort("postModified", {
                        order: "desc",
                    });
                } else if (value == "avg-rating") {
                    thisModule.featureList.sort("positiveScore", {
                        order: "desc",
                    });
                }
            }
        );
    },
};

module.exports = UserReviewsList;
