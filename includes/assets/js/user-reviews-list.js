// import List from "list.js";
var List = require("list.js");

var UserReviewsList = {
  init: function() {
    var options = {
      valueNames: ["title", "content"]
    };

    this.featureList = new List("lovely-things-list", options);
    this.eventHandlers();
  },

  eventHandlers: function() {
    console.log("UserReviewsList eventHandlers");
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
