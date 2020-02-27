var Modal = require("./modal.js");
var Slider = require("./slider.js");

var triggerOnce = false;

var selectors = {
    showGallery: ".show-gallery",
    gallery: ".photos-gallery",

    galleryPhotos: ".photos-gallery .card",
    reviewPhotos: ".review-photos .card",

    modal: "#photos-review-modal",
    modal_deny: "#photos-review-modal .close.icon",

    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",
};

var Gallery = {
    init: function () {
        Modal.init(selectors.modal, selectors.modal_deny);
        this.eventHandler();
        reviewPhotosPreview.init();
    },

    eventHandler: function () {
        this.showGallery();
    },

    showGallery: function () {
        var thisModule = this;

        jQuery(selectors.showGallery).click(function () {
            Modal.show(selectors.modal);
            jQuery('.gallery-section').show();
            jQuery('.slider-section').hide().find('.header').show();

            // Trigger once Gallery events because we attach the rest of the ajax request after succsessful response 
            if (triggerOnce)
                return;
            triggerOnce = true;

            thisModule.addRestOfThePhotos();
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
            gallery.append(this.getCardPlaceholderHTML(data));

            jQuery.post(scr_ajax.ajax_url, data, function (results) {
                results = JSON.parse(results);
                thisModule.updateImageFromPlaceholder(results);
                thisModule.addRestOfThePhotos();
                Slider.refreshSlider();
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
        var sum = data.totalCount - data.shownCount;
        var loopLimit = (sum >= data.limit) ? data.limit : sum;
        var cardHTML = '';
        for (var index = 0; index < loopLimit; index++) {
            cardHTML += this.cardPlaceholderHtml(data);
        }
        return cardHTML;
    },

    cardPlaceholderHtml: function (data) {
        var html = '<div class="card card-placeholder" data-set="' + data.shownCount + '">';
        html += '<div class="ui placeholder">';
        html += '<div class="square image"></div>';
        html += '</div>';
        html += '</div>';
        return html;
    }
};


var reviewPhotosPreview = {
    init: function () {

        var sliderTop = document.querySelector(selectors.sliderTop).swiper;
        var sliderThumbs = document.querySelector(selectors.sliderThumbs).swiper;

        var controls = {
            allSectionEl: jQuery('.gallery-section'),
            sliderSectionEl: jQuery('.slider-section'),
            modal: selectors.modal,
            sliderTop: sliderTop,
            sliderThumbs: sliderThumbs
        };

        reviewPhotosPreview.addSlides(controls);


        jQuery(selectors.reviewPhotos).click(this.addSlides(controls));
    },

    addSlides: function (controls) {
        return function () {
            Modal.show(controls.modal);
            var set = jQuery(this).data('set');
            var photosGroup = jQuery(selectors.reviewPhotos + "[data-set=" + set + "]");

            // Show Review Photos Slider
            controls.allSectionEl.hide();
            controls.sliderSectionEl.show();
            controls.sliderSectionEl.find('.header').hide();

            // Remove Previous Slides
            controls.sliderTop.removeAllSlides();
            controls.sliderThumbs.removeAllSlides();

            // var images = preview.find('.image');
            for (var index = 0; index < photosGroup.length; index++) {
                var sliderHtml = '<div class="photos-review__slide swiper-slide">' + photosGroup[index].innerHTML + '</div>';
                controls.sliderTop.addSlide(index, sliderHtml);
                controls.sliderThumbs.addSlide(index, sliderHtml);
            }
        };
    }
}
module.exports = Gallery;