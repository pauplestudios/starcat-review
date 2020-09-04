var PremiumTease = {
    init: function () {
        this.eventHandler();
    },
    eventHandler: function () {
        console.log("Good one Go Pro");
        var disabledSection = jQuery(".scr-csf__section--disable");
        disabledSection.append(PremiumTease.getHtml());
    },

    getHtml: function () {
        var html = "";
        html += '<div class="scr-csf-premiumtease-container">';
        html += '<button class="ui green labeled icon button"><i class="sign in alternate large icon"></i> ';
        html += 'Go Premium';
        html += '</button>';
        html += '</div>';
        return html;
    }
};

module.exports = PremiumTease;