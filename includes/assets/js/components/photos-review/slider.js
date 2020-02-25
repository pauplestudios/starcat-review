var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-gallery-top",
    sliderThumbs: ".photos-review-gallery-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",
};

var PhotosReview = {
    init: function () {
        this.eventHandler();
    },

    eventHandler: function () {
        this.initSwiperSlider();
    },

    initSwiperSlider: function () {

        var sliderThumbsArgs = {
            spaceBetween: 10,
            slidesPerView: "auto",
            touchRatio: 0.4,
            slideToClickedSlide: true,
            keyboard: {
                enabled: true,
                onlyInViewport: false
            },
        };

        var sliderThumbs = new Swiper(selectors.sliderThumbs, sliderThumbsArgs);

        var sliderTopArgs = {
            spaceBetween: 10,
            navigation: {
                nextEl: selectors.btnNext,
                prevEl: selectors.btnPrev,
            },

            keyboard: {
                enabled: true,
            },
            thumbs: {
                swiper: sliderThumbs,
            },
        };

        new Swiper(selectors.sliderTop, sliderTopArgs);
    },

};

module.exports = PhotosReview;