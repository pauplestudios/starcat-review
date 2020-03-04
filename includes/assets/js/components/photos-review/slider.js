var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",

    reviewPhotos: ".review-photos .card",
    galleryPhotos: ".photos-gallery .card",
};

var Slider = {
    init: function () {
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

    show: function (props) {
        console.log(props);
        // Slider Controls
        Slider.addInitialSlides(props);
        if (props.type == 'gallery') {
            Slider.appendSlides(props.next);
        }
    },

    getProps: function (reviewID, type) {
        var group = (type == 'review') ? selectors.reviewPhotos : selectors.galleryPhotos;

        var photos = jQuery(group + "[data-review-id=" + reviewID + "]");
        var props = {
            type: type,
            slides: photos,
            reviewID: reviewID,
            next: photos.last().next().data('review-id'),
            prev: photos.first().prev().data('review-id'),
        };

        return props;
    },

    addInitialSlides: function (props) {

        // Destroy Previous Slider
        document.querySelector(selectors.sliderTop).swiper.destroy(true);
        document.querySelector(selectors.sliderThumbs).swiper.destroy(true);

        var sliderHTML = '';
        var wrapper = ' .photos-review-wrapper.swiper-wrapper';
        for (var index = 0; index < props.slides.length; index++) {
            sliderHTML += '<div class="photos-review__slide swiper-slide"  data-review-id="' + props.reviewID + '">' + props.slides[index].innerHTML + '</div>';
        }

        jQuery(selectors.sliderTop + wrapper).html(sliderHTML);
        jQuery(selectors.sliderThumbs + wrapper).html(sliderHTML);

        Slider.initSwiperSlider();
    },

    appendSlides: function (next) {
        var sliderTop = document.querySelector(selectors.sliderTop).swiper;
        var sliderThumbs = document.querySelector(selectors.sliderThumbs).swiper;

        if (next) {
            sliderTop.on("reachEnd", function () {

                var photos = jQuery(selectors.galleryPhotos + "[data-review-id=" + next + "]");
                var last = photos.last().next().data('review-id');

                for (var index = 0; index < photos.length; index++) {
                    var sliderHtml = '<div class="photos-review__slide swiper-slide" data-review-id="' + next + '">' + photos[index].innerHTML + '</div>';
                    sliderTop.appendSlide(sliderHtml);
                    sliderThumbs.appendSlide(sliderHtml);
                }
                jQuery(selectors.sliderThumbs + " [data-review-id=" + next + "]").hide();
                next = last;
            });
        }

        sliderTop.on("slideChangeTransitionEnd", function () {
            var activeSlide = jQuery(selectors.sliderTop + ' .swiper-slide.swiper-slide-active').data('review-id');
            jQuery(selectors.sliderThumbs + ' .swiper-slide').hide();
            jQuery(selectors.sliderThumbs + " [data-review-id=" + activeSlide + "]").show();
        });
    }

};

module.exports = Slider;