var UserReviewsList = require("./components/user-reviews-list.js");
var Ratings = require("./components/ratings.js");
// var Form = require("./components/form.js");
var ListControl = require("./blocks/list-control.js");
var ComparisonTable = require("./comparison-table.js");
var Comparison = require("./components/comparison-table/comparison.js");
var ProductComparison = require("./components/product-compare/compare.js");
var Sidebar = require("./components/product-compare/sidebar.js");
var ReviewsList = require("./components/reviews-list.js");

var HelpieReviews = {
  init: function() {
    UserReviewsList.init();
    ListControl.init();
    Comparison.init();
    ProductComparison.init();
    Sidebar.init();
    Ratings.init();
    // Form.init();
    ListControl.init();
    ReviewsList.init();
  }
};

jQuery(document).ready(function() {
  HelpieReviews.init();
});

import "./../style.scss";
import { format } from "url";
