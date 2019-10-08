var Submission = require("./submission.js");

var ProsAndCons = {
    init: function() {
        this.eventListener();
    },

    eventListener: function() {
        this.getRepeater(".review-pros-repeater", "pros");
        this.getRepeater(".review-cons-repeater", "cons");
    },

    getRepeater: function(selector, listAttr) {
        const list = jQuery(selector).find(
            "[data-repeater-list=" + listAttr + "]"
        );

        const item = list
            .find("[data-repeater-item]")
            .first()
            .parent()
            .html();

        jQuery(selector + " [data-repeater-create]").on("click", function() {
            list.append(item);
            ProsAndCons.reinitiateEvents(selector);
        });

        ProsAndCons.reinitiateEvents(selector);
    },

    reinitiateEvents: function(selector) {
        ProsAndCons.getDeleteEvent(
            selector + " [data-repeater-item] [data-repeater-delete]"
        );

        Submission.eventListener();
        jQuery(selector + " .ui.dropdown").dropdown({
            allowAdditions: true
        });
    },

    getDeleteEvent: function(selector) {
        jQuery(selector).on("click", function() {
            jQuery(this)
                .parent()
                .parent()
                .fadeOut()
                .remove();
        });
    }
};

module.exports = ProsAndCons;
