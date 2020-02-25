var Modal = require("./modal.js");
var selectors = {
    preview: ".all-photos-gallery-preview",
    showGallery: ".show-all-photos-gallery",

    modal: "#photos-review-modal",
    modal_deny: "#photos-review-modal .close.icon",
};

var Gallery = {
    init: function () {
        Modal.init(selectors.modal, selectors.modal_deny);
        this.eventHandler();
    },

    eventHandler: function () {
        this.galleryPreview();
    },

    galleryPreview: function () {

        jQuery(selectors.showGallery).click(function () {
            Modal.show(selectors.modal);
            jQuery('.all-photos-gallery .card img.image')
                .visibility({
                    type: 'image',
                    transition: 'fade in',
                    duration: 3000
                });
            // console.log("Show PHotos reviews Modal");
        });

        data = {
            action: "get_all_photos"
        };

        jQuery(selectors.modal + ' .scrolling.content').scroll(function () {
            if (this.offsetHeight + this.scrollTop == this.scrollHeight) {
                // jQuery.post(scr_ajax.ajax_url, data, function () {

                // });
            }
        });
    },



};

module.exports = Gallery;