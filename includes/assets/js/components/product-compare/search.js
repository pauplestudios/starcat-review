var Search = {
  init: function() {
    this.bindEvents();
  },
  bindEvents: function() {
    var search_element = jQuery(".hrp-search-container");
    this.searchProduct(search_element);
  },
  searchProduct: function(search_element) {
    console.log(this);
    var search_list = jQuery(search_element).find(".hrp-search-lists");
    jQuery(search_element).on("keyup", ".hrp-search", function() {
      var search_data = {
        action: "get_hrp_results",
        search_key: jQuery(this).val()
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
              content += '<div class="items">' + result_data[i] + "</div>";
              jQuery(search_list).append(content);
            }
          } else {
            var content = "";
            content += '<div class="items">Not found data</div>';
            jQuery(search_list).append(content);
          }
        }
      });
    });
  }
  // clearSearchListContainer: function(hrp_search_list_container) {
  //   jQuery(hrp_search_list_container).empty();
  // }
};

module.exports = Search;
