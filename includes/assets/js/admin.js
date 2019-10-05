var Admin = {
    init: function() {
        this.eventhandlers();
    },
    eventhandlers: function() {
        console.log("HRP Admin Js loaded !!!");
        this.iconsOptins();
        this.enableProsandCons();
    },

    iconsOptins: function() {
        jQuery(".ui.dropdown.hrp-dropdown").dropdown();
    },

    enableProsandCons: function() {
        const metaBoxOptions = jQuery("#_helpie_reviews_post_options");

        if (HRPOptins.enable_prosandcons == "0") {
            metaBoxOptions
                .find("[data-section='_helpie_reviews_post_options_2']")
                .css({ display: "none" });
            metaBoxOptions
                .find("[data-section='_helpie_reviews_post_options_3']")
                .css({ display: "none" });
        }
    }
};

jQuery(document).ready(function() {
    Admin.init();
});

import "./../admin.scss";
import { format } from "url";
