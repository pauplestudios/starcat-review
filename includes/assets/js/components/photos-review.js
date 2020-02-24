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


        // jQuery.ajax(settings).done(function (response) {
        //     // console.log(response);
        //     thisModule.addSlidewithSrc(response);
        // });

        setTimeout(function () {
            Modal.init(selectors.modal, selectors.modal_deny);
        }, 300);

        this.eventHandler();

        jQuery(selectors.allPhotosList + ' .image').click(function () {
            console.log("I am being clicked");
            Modal.show(selectors.modal);
        });
    },

    addSlidewithSrc: function (data) {
        var slidesHTML = '';
        for (var index = 0; index < data.photos.length; index++) {
            var src = data.photos[index].src.large;

            slidesHTML += '<div class="swiper-slide"><img src="' + src + '"/></div>';
        }
        jQuery('.swiper-container .swiper-wrapper').html(slidesHTML);


    },

    eventHandler: function () {
        var thisModule = this;

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

        // var swiperNamespaceClasses = thisModule.getSwiperNamespaceClasses();
        // galleryTopArgs = Object.assign(swiperNamespaceClasses, galleryTopArgs);
        // galleryThumbsArgs = Object.assign(swiperNamespaceClasses, galleryThumbsArgs);


        var galleryThumbs = new Swiper(selectors.galleryThumbs, galleryThumbsArgs);
        var galleryTop = new Swiper(selectors.galleryTop, galleryTopArgs);

        /* set conteoller  */
        galleryTop.controller.control = galleryThumbs;
        galleryThumbs.controller.control = galleryTop;

    },

    getSwiperNamespaceClasses: function () {
        return {
            slideClass: "photos-review__slide",
            slideActiveClass: "photos-review__slide-active",
            slideDuplicateActiveClass: "photos-review__slide-duplicate-active",
            slidePrevClass: "photos-review__slide-prev",
            slideDuplicatePrevClass: "photos-review__slide-duplicate-prev",
            slideNextClass: "photos-review__slide-next",
            slideDuplicateNextClass: "photos-review__slide-duplicate-next",

            wrapperClass: "photos-review-wrapper",
        };
    }
};

module.exports = PhotosReview;