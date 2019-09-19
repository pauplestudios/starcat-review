var UserReviewsList = require("./components/user-reviews-list.js");
var Ratings = require("./components/ratings.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");
var Comparison = require("./components/comparison-table/comparison.js");
var ProductComparison = require("./components/product-compare/compare.js");
var compareSidebarList = require("./components/product-compare/sidebar.js");

var HelpieReviews = {
  init: function() {
    UserReviewsList.init();
    Ratings.init();
    ListControl.init();
    //Comparison.init();
    ProductComparison.init();
  },

  eventHandlers: function() {
    var thisModule = this;
  }
};

jQuery(document).ready(function() {
  HelpieReviews.init();
});

import "./../style.scss";
