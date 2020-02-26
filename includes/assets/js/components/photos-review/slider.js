var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-gallery-top",
    sliderThumbs: ".photos-review-gallery-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",
};

var Slider = {
    init: function () {
        this.eventHandler();
    },

    eventHandler: function () {
        this.initSwiperSlider();
    },

    initSwiperSlider: function () {
        var thisModule = this;

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

        var sliderTop = new Swiper(selectors.sliderTop, sliderTopArgs);
        jQuery('.remove-all-slides').click(thisModule.removeSlides(sliderTop, sliderThumbs));
        jQuery('.add-slides').click(thisModule.addSlides(sliderTop, sliderThumbs));
    },

    removeSlides: function (sliderTop, sliderThumbs) {
        return function () {
            sliderTop.removeAllSlides();
            sliderThumbs.removeAllSlides();
        };
    },

    addSlides: function (sliderTop, sliderThumbs) {
        return function () {
            var preview = jQuery('.all-photos-gallery-preview');
            console.log('addSlides');

            sliderTop.removeAllSlides();
            sliderThumbs.removeAllSlides();

            var images = preview.find('.image');
            for (var index = 0; index < images.length; index++) {
                var sliderHtml = '<div class="photos-review__slide swiper-slide">' + images[index].innerHTML + '</div>';
                sliderTop.addSlide(index, sliderHtml);
                sliderThumbs.addSlide(index, sliderHtml);
            }
        };
    }

};

module.exports = Slider;