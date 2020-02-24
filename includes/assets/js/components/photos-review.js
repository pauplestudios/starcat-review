var Modal = require("../blocks/modal");
var Swiper = require('swiper').default;

var selectors = {
    slide: ".scr-photos-review .photos-review__slide",
    wrapper: ".photos-review-wrapper",
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",
    galleryTop: ".photos-review-gallery-top",
    galleryThumbs: ".photos-review-gallery-thumbs",

    allPhotosList: ".all-photos-list",
    showAllPhotosList: ".show-all-photos-list",
    galleryAllPhotosList: ".all-photos-review-gallery",
    reviewPhotosList: ".scr-photos-review .review-photos-list",

    modal: "#photos-review-modal",
    modal_deny: "#photos-review-modal .actions .deny",
    modal_submit: "#photos-review-modal .actions .positive",
};

var PhotosReview = {
    init: function () {
        var thisModule = this;
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": "https://api.pexels.com/v1/curated?per_page=15&page=random",
            "method": "GET",
            "Authorization": "563492ad6f91700001000001bf9801e8dc3f4828a7f31a183411cbce"

        };

        this.eventHandler();
    },


    eventHandler: function () {
        this.allPhotosList();
        this.reviewPhotosList();

        setTimeout(function () {
            Modal.init(selectors.modal, selectors.modal_deny);
        }, 300);
    },

    allPhotosList: function () {
        jQuery(selectors.showAllPhotosList).click(function () {
            Modal.show(selectors.modal);
        });
    },

    reviewPhotosList: function () {
        var thisModule = this;

        var galleryTopArgs = {
            spaceBetween: 10,
            navigation: {
                nextEl: selectors.btnNext,
                prevEl: selectors.btnPrev,
            },

            keyboard: {
                enabled: true,
            },
        };

        var galleryThumbsArgs = {
            spaceBetween: 10,
            centeredSlides: true,
            slidesPerView: "auto",
            touchRatio: 0.4,
            slideToClickedSlide: true,
            keyboard: {
                enabled: true,
                onlyInViewport: false
            }
        };

        var galleryThumbs = new Swiper(selectors.galleryThumbs, galleryThumbsArgs);
        var galleryTop = new Swiper(selectors.galleryTop, galleryTopArgs);

        /* set conteoller  */
        if (galleryTop.controller && galleryThumbs.controller) {
            galleryTop.controller.control = galleryThumbs;
            galleryThumbs.controller.control = galleryTop;
        }
    },

};

module.exports = PhotosReview;