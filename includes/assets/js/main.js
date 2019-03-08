var UserReviewsList = require("./user-reviews-list.js");

var HelpieReviews = {
  init: function() {
    UserReviewsList.init();
  },

  eventHandlers: function() {
    var thisModule = this;
  }
};

jQuery(document).ready(function() {
  HelpieReviews.init();
});

import "./../style.scss";
