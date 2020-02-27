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
        this.initSlider();
    },

    initSlider: function () {

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

        jQuery('.gallery-section').show();
        jQuery('.slider-section').hide();

        this.galleryEvents(sliderTop, sliderThumbs);
    },

    refreshSlider: function () {
        var sliderTop = document.querySelector(selectors.sliderTop).swiper;
        var sliderThumbs = document.querySelector(selectors.sliderThumbs).swiper;

        Slider.galleryEvents(sliderTop, sliderThumbs);
    },

    galleryEvents: function (sliderTop, sliderThumbs) {

        var controls = {
            allSectionEl: jQuery('.gallery-section'),
            sliderSectionEl: jQuery('.slider-section'),
            sliderTop: sliderTop,
            sliderThumbs: sliderThumbs
        };

        jQuery('.photos-gallery .card').click(this.addSlides(controls));

        jQuery('.slider-section .header .arrow.left').click(function () {
            controls.allSectionEl.show();
            controls.sliderSectionEl.hide();
        });
    },

    addSlides: function (controls) {
        return function () {
            var set = jQuery(this).data('set');
            var photosGroup = jQuery(".photos-gallery .card[data-set=" + set + "]");

            // Show Review Photos Slider
            controls.allSectionEl.hide();
            controls.sliderSectionEl.show();

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

};

module.exports = Slider;