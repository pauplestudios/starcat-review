var SCRClipboard = require("./components/clipboard");

var Admin = {
    init: function () {
        this.eventhandlers();
    },
    eventhandlers: function () {
        console.log("SCR Admin Js loaded !!!");
        this.iconsOptins();
        this.enableProsandCons();
        this.animateStats();
        SCRClipboard.init();
    },

    iconsOptins: function () {
        jQuery(".ui.dropdown.scr-dropdown").dropdownX();
    },

    enableProsandCons: function () {
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

    animateStats: function () {
        // Animating Reviewed Stat
        var reviewed = jQuery(".reviewed-list");
        var animate = reviewed.attr("data-animate");

        if (animate == "1") {
            reviewed.find(".reviewed-item").each(function (i) {
                var reviewedItem = jQuery(this);
                var value = reviewedItem.find("input[name]").attr("value");

                reviewedItem
                    .find(".stars-result")
                    .css({ transition: "width 1s", width: value + "%" });
                reviewedItem
                    .find(".bars-result")
                    .css({ transition: "width 1s", width: value + "%" });
            });
        }
    },
};

jQuery(document).ready(function () {
    Admin.init();
});

import "./../admin.scss";
