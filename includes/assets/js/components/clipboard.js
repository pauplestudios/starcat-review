var selectors = {
    clipboard: ".scr_clipboard",
    button: ".csf-after-text",
};

var SCRClipboard = {
    init: function () {
        console.log("Init Clipboard");
        this.eventHandler();
    },

    eventHandler: function () {
        jQuery(selectors.clipboard).on("click", selectors.button, function () {
            let copiedContent = jQuery(this)
                .parent()
                .find("input[type='text']")
                .val();
            let textArea = document.createElement("textarea");
            textArea.value = copiedContent;
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand("Copy");
            textArea.remove();

            SCRClipboard.showNotice("Copied!", 100);
            SCRClipboard.showNotice("Copy Clipboard", 1000);
        });
    },
    showNotice: function (message, durations) {
        setTimeout(function () {
            jQuery(selectors.clipboard).find(selectors.button).html(message);
        }, durations);
    },
};

module.exports = SCRClipboard;
