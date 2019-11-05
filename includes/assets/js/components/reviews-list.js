/* Triggered by SCR events, integrates with Insights */
var ReviewsList = {
    init: function(nonce) {
        console.log("nonce: " + nonce);
        // this.eventHandler();
    },

    /* EVENTS API */

    /* Auto-ordering methods */
    clickCounter: function(id) {
        this.ajaxRequest(id);
    },

    /* INTERNAL METHODS */
    ajaxRequest: function(id) {
        var thisModule = this;

        var data = {
            action: "scr_listing_action",
            nonce: thisModule.nonce,
            id: id
        };

        jQuery.post(my_scr_ajax_object.ajax_url, data, function(response) {
            console.log(response);
        });
    }
};

module.exports = ReviewsList;
