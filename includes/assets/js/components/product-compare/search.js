var productsTable = require("../../comparison-table.js");
// var CompareTable = require("../../comparison-table.js");

var Search = {
  init: function() {
    this.bindEvents();
  },
  bindEvents: function() {
    var search_element_container = jQuery(".hrp-search-container");
    this.searchProduct(search_element_container);
    this.selectItem(search_element_container);
    this.closeSearchListDiv();
    var props = {};
    this.addItemInCompareTable(props);
  },
  searchProduct: function(search_element) {
    console.log(this);
    var search_list = jQuery(search_element).find(".hrp-search-lists");
    jQuery(search_element).on("keyup", ".hrp-search", function() {
      var search_data = {
        action: "get_hrp_results"
      };

      jQuery.ajax({
        type: "POST",
        url: hrp_ajax.ajax_url,
        data: search_data,
        dataType: "json",
        success: function(response) {
          console.log(response);
          jQuery(search_list).show();
          jQuery(search_list).empty();
          result_data = response.data;
          resultDatalength = result_data.length;

          if (resultDatalength > 0) {
            console.log(result_data);
            for (let i = 0; i < resultDatalength; i++) {
              console.log(result_data[i]);
              var content = "";
              content += '<div class="item">' + result_data[i] + "</div>";
              jQuery(search_list).append(content);
            }
          } else {
            var content = "";
            content += '<div class="item">Not found data</div>';
            jQuery(search_list).append(content);
          }
        }
      });
    });
  },
  selectItem: function(search_element_container) {
    jQuery(search_element_container).on(
      "click",
      ".hrp-search-lists .item",
      function(e) {
        e.preventDefault();
        let heading = jQuery(this)
          .text()
          .trim();
        jQuery(search_element_container)
          .find(".hrp-search")
          .val(heading);
        jQuery(".hrp-search-lists").hide();

        contents = {
          headingText: heading
        };
        //
        //new Search.addItemInCompareTable(contents);
      }
    );
  },
  closeSearchListDiv: function() {
    jQuery(document).mouseup(function(e) {
      container = jQuery(".hrp-search-lists");
      if (!container.is(e.target) && container.has(e.target).length === 0) {
        container.hide();
      }
    });
  },
  loadCompareTable: function() {
    console.log("loadComparetable");
    var comparisonTables = [];
    jQuery(".cd-products-comparison-table").each(function() {
      //create a productsTable object for each .cd-products-comparison-table
      console.log(jQuery(this));
      comparisonTables.push(new productsTable(jQuery(this)));
    });
  },
  addItemInCompareTable: function(options) {
    var that = this;
    if (Object.keys(options).length === 0) {
      return 1;
    } else {
      let content = "";
      content = '<li class="product"><div class="top-info">';
      content += '<div class="check"></div>';
      content += '<img src="" alt="" class="featured-image">';
      content += "<h3>" + options.headingText + "</h3></div>";
      content +=
        '<ul class="cd-features-list"><li>5</li><li>4.5</li><li>4.5</li></ul>';
      content += "</div></li>";

      jQuery(".cd-products-wrapper")
        .find(".cd-products-columns")
        .append(content);
      // that.loadCompareTable();
      var comparisonTables = [];
      jQuery(".cd-products-comparison-table").each(function() {
        //create a productsTable object for each .cd-products-comparison-table
        console.log(jQuery(this));
        comparisonTables.push(new productsTable(jQuery(this)));
      });
      console.log("load-compare table");
      // jQuery(".cd-products-comparison-table").each(function() {
      //   //create a productsTable object for each .cd-products-comparison-table
      //   new productsTable.productsTable(jQuery(this));
      // });
    }
  }
};

module.exports = Search;
