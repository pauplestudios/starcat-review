var Search = {
    init: function() {
        console.log('Comparison Table Search Loaded !!!');               
        this.eventHandlers();
    },   

    eventHandlers: function(){    	
        let data = {
            action: "helpiereview_search_posts",
            nonce: hrp_ajax.ajax_nonce
        };

    	jQuery.post(hrp_ajax.ajax_url, data, function(results){
            results = JSON.parse(results);
            jQuery(".ui.search").search({
                source : results
            });
        })
    }

};

module.exports = Search;
    