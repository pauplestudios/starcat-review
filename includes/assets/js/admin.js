var Admin = {
    init: function() {
        this.eventhandlers();
    },
    eventhandlers: function() {
        console.log("SCR Admin Js loaded !!!");
        this.iconsOptins();
        this.enableProsandCons();
    },

    iconsOptins: function() {
        jQuery(".ui.dropdown.scr-dropdown").dropdownX();
    },

    enableProsandCons: function() {
        var metaBoxOptions = jQuery("#_scr_post_options");

        if (SCROptions.enable_prosandcons == "0") {
            metaBoxOptions
                .find("[data-section='_scr_post_options_2']")
                .css({ display: "none" });
            metaBoxOptions
                .find("[data-section='_scr_post_options_3']")
                .css({ display: "none" });
        }
    },
};

jQuery(document).ready(function() {
    Admin.init();
});

import "./../admin.scss";
import { format } from "url";
