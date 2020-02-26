var Modal = require("./modal.js");
var firedGalleryEvents = false;

var selectors = {
    preview: ".all-photos-gallery-preview",
    showGallery: ".show-all-photos-gallery",
    gallery: ".all-photos-gallery",

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
        var thisModule = this;

        jQuery(selectors.showGallery).click(function () {
            Modal.show(selectors.modal);

            // Trigger only once Gallery events because we attach rest of the request into reponse of ajax request
            if (firedGalleryEvents)
                return;
            firedGalleryEvents = true;
            thisModule.addRestOfTheGalleryPhotos();
        });
    },


    addRestOfTheGalleryPhotos: function () {
        var thisModule = this;
        var shownGallery = jQuery(selectors.showGallery);
        var gallery = jQuery(selectors.gallery);

        var limit = shownGallery.data("limit");
        var shownCount = shownGallery.data("shown-count");
        var totalCount = shownGallery.data("total-count");

        var data = {
            action: "scr_phtos_review",
            limit: limit,
            from: shownCount
        };

        if (shownCount !== totalCount) {
            gallery.append(this.getCardPlaceholderHTML(data));

            jQuery.post(scr_ajax.ajax_url, data, function (results) {
                results = JSON.parse(results);
                thisModule.updateImageFromPlaceholder(results);
                thisModule.addRestOfTheGalleryPhotos();
            });
        }


    },

    updateImageFromPlaceholder: function (images) {
        var gallery = jQuery(selectors.gallery);
        var shownGallery = jQuery(selectors.showGallery);
        var cardPlaceholder = gallery.find(".card-placeholder");
        var shownCount = shownGallery.data("shown-count");

        for (var index = 0; index < images.length; index++) {
            var card = jQuery(cardPlaceholder[index]);
            card.removeClass('card-placeholder');
            card.html("<img class='image' src='" + images[index] + "' />");
        }

        shownGallery.data("shown-count", shownCount + images.length);
    },

    getCardPlaceholderHTML: function (data) {

        var cardHTML = '';
        for (var index = 0; index < data.limit; index++) {
            cardHTML += this.cardPlaceholderHtml();
        }
        return cardHTML;
    },

    cardPlaceholderHtml: function () {
        var html = '<div class="card card-placeholder">';
        html += '<div class="ui placeholder">';
        html += '<div class="square image"></div>';
        html += '</div>';
        html += '</div>';
        return html;
    }


};

module.exports = Gallery;