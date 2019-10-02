var Admin = {
    init: function() {
        this.eventhandlers();
    },
    eventhandlers: function() {
        // console.log("Helpie_FAQ Admin JS Init");
        var thisModule = this;
        jQuery(".ui.dropdown.hrp-dropdown").dropdown();
        console.log("HRP Admin Js loaded !!!");
    }
};

jQuery(document).ready(function() {
    Admin.init();
});

import "./../admin.scss";
import { format } from "url";
