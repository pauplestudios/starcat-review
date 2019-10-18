var Search = {
    init: function() {
        console.log("Comparison Table Search Loaded !!!");
        this.eventHandlers();
    },

    eventHandlers: function() {
        let data = {
            action: "scr_search_posts",
            nonce: scr_ajax.ajax_nonce
        };

        jQuery.post(scr_ajax.ajax_url, data, function(results) {
            results = JSON.parse(results);
            jQuery(".ui.search").search({
                source: results
            });
        });
    }
};

module.exports = Search;
