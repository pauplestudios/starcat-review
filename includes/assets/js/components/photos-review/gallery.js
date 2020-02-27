var Modal = require("./modal.js");
var Slider = require("./slider.js");

var triggerOnce = false;

var selectors = {
    showGallery: ".show-gallery",
    gallery: ".photos-gallery",

    singleReviewPhotos: ".review-photos .card",
    singleGalleryPhotos: ".photos-gallery .card",
    singleGalleryPhotosPreview: ".photos-gallery-preview .image",

    modal: "#photos-review-modal",
    modalClose: "#photos-review-modal .close.icon",

    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",

    gallerySection: ".gallery-section",
    sliderSection: ".slider-section",

    goBackToGallery: ".slider-section .header .arrow.left"
};

var Gallery = {
    init: function () {
        this.eventHandler();
    },

    eventHandler: function () {
        this.showGallery();
        this.goBackToGallery();
        this.onReviewPhotosClick();
        this.onGalleryPhotosClick();
        this.onGalleryPhotosPreviewClick();

        Modal.init(selectors.modal, selectors.modalClose);
    },

    showGallery: function () {
        var thisModule = this;

        jQuery(selectors.showGallery).click(function (e) {
            e.stopPropagation();
            Modal.show(selectors.modal);
            jQuery(selectors.gallerySection).show();
            jQuery(selectors.sliderSection).hide().find('.header').show();

            // Trigger once Gallery events because we attach the rest of the ajax request after succsessful response 
            if (triggerOnce)
                return;
            triggerOnce = true;

            thisModule.addRestOfThePhotos();
        });

    },

    goBackToGallery: function () {
        jQuery(selectors.goBackToGallery).click(function () {
            jQuery(selectors.gallerySection).show();
            jQuery(selectors.sliderSection).hide();
        });
    },

    addRestOfThePhotos: function () {
        var thisModule = this;
        var shownGallery = jQuery(selectors.showGallery);
        var gallery = jQuery(selectors.gallery);

        var limit = shownGallery.data("limit");
        var shownCount = shownGallery.data("shown-count");
        var totalCount = shownGallery.data("total-count");

        var data = {
            action: "scr_phtos_review",
            limit: limit,
            from: shownCount,
            shownCount: shownCount,
            totalCount: totalCount,
        };

        if (shownCount !== totalCount) {
            var placeholdersHTML = this.getCardPlaceholders(data);
            gallery.append(placeholdersHTML);

            jQuery.post(scr_ajax.ajax_url, data, function (results) {
                results = JSON.parse(results);
                thisModule.setImagesFromPlaceholder(results);
                thisModule.addRestOfThePhotos();
                thisModule.onGalleryPhotosClick();
            });
        }
    },

    onReviewPhotosClick: function () {
        var singleReviewPhotos = jQuery(selectors.singleReviewPhotos);
        singleReviewPhotos.unbind();

        singleReviewPhotos.click(function () {
            var currentPhotosGroup = jQuery(this).data('set');
            var group = jQuery(selectors.singleReviewPhotos + "[data-set=" + currentPhotosGroup + "]");

            Modal.show(selectors.modal);
            jQuery(selectors.gallerySection).hide();
            jQuery(selectors.sliderSection).show().find('.header').hide();
            Slider.addSlideControls(group);
        });
    },

    onGalleryPhotosClick: function () {
        var singleGalleryPhotos = jQuery(selectors.singleGalleryPhotos);
        singleGalleryPhotos.unbind();

        singleGalleryPhotos.click(function () {
            var currentPhotosGroup = jQuery(this).data('set');
            var group = jQuery(selectors.singleGalleryPhotos + "[data-set=" + currentPhotosGroup + "]");

            jQuery(selectors.gallerySection).hide();
            jQuery(selectors.sliderSection).show();
            Slider.addSlideControls(group);
        });
    },

    onGalleryPhotosPreviewClick: function () {
        var singleGalleryPhotosPreview = jQuery(selectors.singleGalleryPhotosPreview);

        singleGalleryPhotosPreview.click(function () {
            var currentPhotosGroup = jQuery(this).data('set');
            var group = jQuery(selectors.singleGalleryPhotos + "[data-set=" + currentPhotosGroup + "]");

            Modal.show(selectors.modal);
            jQuery(selectors.gallerySection).hide();
            jQuery(selectors.sliderSection).show().find('.header').hide();
            Slider.addSlideControls(group);
        });
    },

    setImagesFromPlaceholder: function (images) {
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

    getCardPlaceholders: function (data) {
        var sum = data.totalCount - data.shownCount;
        var loopLimit = (sum >= data.limit) ? data.limit : sum;
        var cardHTML = '';
        for (var index = 0; index < loopLimit; index++) {
            cardHTML += this.getCardPlaceholderHtml(data);
        }
        return cardHTML;
    },

    getCardPlaceholderHtml: function (data) {
        var html = '<div class="card card-placeholder" data-set="' + data.shownCount + '">';
        html += '<div class="ui placeholder">';
        html += '<div class="square image"></div>';
        html += '</div>';
        html += '</div>';
        return html;
    }
};


module.exports = Gallery;