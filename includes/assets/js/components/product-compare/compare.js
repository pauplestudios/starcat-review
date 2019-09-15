var compareTableAction = require("./table-actions.js");
var searchProduct = require("./search.js");
var CompareTable = require("../../comparison-table.js");

var ProductComparison = {
  init: function() {
    console.log("compare product");
    // var hrpCompareTable = new ProductCompareTable(
    //   $(".cd-products-comparison-table")
    // );
    // console.log(hrpCompareTable);

    this.eventHandlers();
  },
  eventHandlers: function() {
    this.addProduct();
    this.addItemToCompare();
    this.compareFloatIcons();
  },
  addProduct: function() {
    var hrpCompareTable = jQuery(".cd-products-comparison-table");
    var hrpProductWrapper = hrpCompareTable.find(".cd-products-wrapper");
    var searchContainer = hrpProductWrapper.find(".hrp-search-filter-wrapper");
    var productHeader = searchContainer.find(".top-info");
    var addProductBtn = jQuery(".hrp-add-product");

    addProductBtn.on("click", function(e) {
      e.stopPropagation();
      var product = "";
      product += '<li class="product">';
      product += '<div class="top-info"><div class="check"></div>';
      product +=
        '<img class="featured-image" src = "http://localhost/wp-dev/wordpress/wp-content/uploads/2019/08/redmi-notw7.jpg" >';
      product += "<h3>new Item</h3></div>";
      product +=
        '<ul class="cd-features-list"><li>3</li><li>3</li><li>3</li></ul>';
      product += "</li>";
      jQuery(".cd-products-columns").append(product);
    });
  },
  addItemToCompare: function() {
    jQuery("#hrp-cat-collection").on(
      "click",
      ".hrp-collection__col",
      function() {
        var $post_item = jQuery(this);
        var headerText = $post_item
          .find(".review-card__header")
          .text()
          .trim();
        var bodyContent = $post_item
          .find(".review-card__body")
          .text()
          .trim();
          console.log();
      }
    );
  },
  compareFloatIcons: function() {
    console.log("float icon generate side bar");
    let content = "";
    content += '<div class="hrp-compare-sidebar right">';
    content += '<div class="hrp-sidebar-wrapper">';
    content += "</div>";
    content += "</div>";

    jQuery("body")
      .find(".site")
      .append(content);
  }
}; //End module

module.exports = ProductComparison;
