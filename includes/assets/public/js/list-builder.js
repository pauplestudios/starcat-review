var ListControl = require("./blocks/list-control.js");

var ListBuilder = {
    init: function() {
        console.log("ListBuilder.init()");
        jQuery("#scr-controlled-list.scr-user-controlled-list").each(function(index, value) {
            if (
                jQuery(this).find(".scr_user_reviews.comments .comment")
                    .length == 0
            ) {
                console.log("no items");
                jQuery(this).hide();
                return;
            }

            console.log(
                "div" + index + ":" + jQuery(this).attr("data-collectionProps")
            );

            var list_config = jQuery(this).attr("data-collectionProps");

            list_config = list_config.replace(/</g, '"');
            list_config = JSON.parse(list_config);
            console.log(list_config);

            ListControl.init(list_config);
        });
    },
};

module.exports = ListBuilder;
