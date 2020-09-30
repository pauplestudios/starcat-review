var amplitude = require("amplitude-js");

var selectors = {
    premiumTeaseLink: ".scr-csf-premiumtease-container a",
};

var AmplitudeIntegration = {
    init: function () {
        console.log("AmplitudeIntegration !!!");
        this.eventHandlers();
    },
    eventHandlers: function () {
        var starcatDevProject = amplitude.getInstance();
        starcatDevProject.init('fa5f06f125230fd1d5508e6ee5efc174'); // API_KEY
        jQuery(selectors.premiumTeaseLink).click(function (eventLog) {
            var premiumTeaseEvent = jQuery(this).text().trim();
            starcatDevProject.logEvent(premiumTeaseEvent);
            eventLog.stopPropagation();
        });
        // if ("some" !== 0) {
        //     
        // }
    }
};

module.exports = AmplitudeIntegration;