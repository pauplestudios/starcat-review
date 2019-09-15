jQuery(document).ready(function($) {
  function searchProduct(element) {
    this.element = element;
    console.log(element);
  }

  var SampleContent = [
    {
      title: "Barbados",
      description: "Helpie WP is the modern WordPress Knowledge Base"
    },
    {
      title: "Bangladesh",
      description: "Helpie WP is the modern WordPress Knowledge Base"
    },
    {
      title: "Belgium",
      description: "Helpie WP is the modern WordPress Knowledge Base"
    },
    {
      title: "Burkina Faso",
      description: "Helpie WP is the modern WordPress Knowledge Base"
    },
    {
      title: "Bulgaria",
      description: "Helpie WP is the modern WordPress Knowledge Base"
    }
  ];

  var $product = $(".hrp-search-container");

  $product.search({
    source: [],
    minCharacters: 3,
    searchFields: ["description", "title"],
    apiSettings: {
      url: hrp_ajax.ajax_url + "?action=get_hrp_results&q={query}",
      onResponse: function(response) {
        console.log(response);
      },

      onSelect: function(result, response) {
        consol.log(result);
        console.log(response);
      }
    }
  });
});
