var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",
};

var Slider = {
    init: function () {
        this.initSwiperSliders();
    },

    initSwiperSliders: function () {

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

    addSlideControls: function (slidesGroup) {
        var controls = {
            slidesGroup: slidesGroup,
            sliderTop: document.querySelector(selectors.sliderTop).swiper,
            sliderThumbs: document.querySelector(selectors.sliderThumbs).swiper,
        };

        Slider.addSlides(controls);
    },

    addSlides: function (controls) {

        controls.sliderTop.removeAllSlides();
        controls.sliderThumbs.removeAllSlides();

        for (var index = 0; index < controls.slidesGroup.length; index++) {
            var sliderHtml = '<div class="photos-review__slide swiper-slide">' + controls.slidesGroup[index].innerHTML + '</div>';
            controls.sliderTop.addSlide(index, sliderHtml);
            controls.sliderThumbs.addSlide(index, sliderHtml);
        }
    }

};

module.exports = Slider;