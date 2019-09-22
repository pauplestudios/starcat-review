var compareTableAction = require("./table-actions.js");
var searchProduct = require("./search.js");
var CompareTable = require("../../comparison-table.js");
var Search = require("./search.js");

var ProductComparison = {
  init: function() {
    console.log("compare product");
    Search.init();
    this.eventHandlers();
  },
  eventHandlers: function() {
    this.addProduct();
    this.addItemToCompare();
    this.compareFloatIcons();
  },
  sample: function() {},
  addProduct: function() {
    var that = this;
    var hrpCompareTable = jQuery(".cd-products-comparison-table");
    var hrpProductWrapper = hrpCompareTable.find(".cd-products-wrapper");
    var searchContainer = hrpProductWrapper.find(".hrp-search-filter-wrapper");
    var productHeader = searchContainer.find(".top-info");
    var addProductBtn = jQuery(".hrp-add-product");
    console.log("check..");
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
      console.log("append content before");
      jQuery(".cd-products-columns").append(product);

      that.loadComparetable();
      console.log("append content after");
    });
  },
  loadComparetable: function() {
    console.log("loadComparetable");
    var comparisonTables = [];
    jQuery(".cd-products-comparison-table").each(function() {
      //create a productsTable object for each .cd-products-comparison-table
      console.log(jQuery(this));
      comparisonTables.push(new productsTable(jQuery(this)));
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
        get_body_text = bodyContent.slice(0, 130);
        body_content = get_body_text.concat("..");
        let options = {};
        options = {
          id: 42,
          heading: headerText,
          desc: body_content
        };

        this.addItemToCompare(options);
        // let item_content = "";
        // item_content += '<div class="items hrp-list-items">';
        // item_content += "<h5>" + headerText + "</h5>";
        // item_content += "<span>" + body_content + "</span>";
        // item_content += "</div>";
        // jQuery("#hrp-compare-sidebar").append(item_content);
        // console.log(headerText, bodyContent);
      }
    );
  },
  compareFloatIcons: function() {
    console.log("float icon generate side bar");
    jQuery("#left-sidebar-toggle").click(function() {
      jQuery("body")
        .find("#id")
        .addClass("pusher");

      jQuery(".ui.sidebar").toggleClass("very thin icon");
      // jQuery("body")
      // // .find("#hrp-compare-sidebar")
      // .toggle("sidebar");
    });
  },
  addItemToCompareList: function(props) {
    //Add Item to sidebar compare list
    let content = "";
    content += '<div class="item" data-id="' + props.id + '">';
    content +=
      "<p>" + props.heading + "</p><span>" + props.desc + "</span></div>";
    jQuery(".hrp-list-items").append(content);
  }
}; //End module

module.exports = ProductComparison;
