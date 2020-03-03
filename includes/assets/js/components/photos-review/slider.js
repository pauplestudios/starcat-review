var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",

    btnDisable: "swiper-button-disabled",
    galleryPhotos: ".photos-gallery .card"
};

var Slider = {
    init: function () {
        // this.initSwiperSliders();
        // this.goToNextReviewSlides();
        // this.goToPrevReviewSlides();
    },

    goToNextReviewSlides: function () {
        jQuery(selectors.btnNext).click(function () {
            var currentPhotosGroup = jQuery(this).data('review-id');
            var group = jQuery(selectors.galleryPhotos + "[data-review-id=" + currentPhotosGroup + "]");

            var slides = {
                prev: group.first().prev().data('review-id'),
                next: group.last().next().data('review-id'),
                slides: group
            };
            Slider.addSlideControls(slides);
        });
    },

    goToPrevReviewSlides: function () {
        jQuery(selectors.btnPrev).click(function () {
            var currentPhotosGroup = jQuery(this).data('review-id');
            var group = jQuery(selectors.galleryPhotos + "[data-review-id=" + currentPhotosGroup + "]");

            var slides = {
                prev: group.first().prev().data('review-id'),
                next: group.last().next().data('review-id'),
                slides: group
            };
            Slider.addSlideControls(slides);
        });
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

    addSlideControls: function (slides) {
        var controls = {
            prev: slides.prev,
            slides: slides.slides,
            next: slides.next,

            sliderTop: document.querySelector(selectors.sliderTop).swiper,
            sliderThumbs: document.querySelector(selectors.sliderThumbs).swiper,
        };

        Slider.addSlides(controls);
    },

    addSlides: function (controls) {


        controls.sliderTop.removeAllSlides();
        controls.sliderThumbs.removeAllSlides();

        for (var index = 0; index < controls.slides.length; index++) {
            var sliderHtml = '<div class="photos-review__slide swiper-slide">' + controls.slides[index].innerHTML + '</div>';
            controls.sliderTop.addSlide(index, sliderHtml);
            controls.sliderThumbs.addSlide(index, sliderHtml);
        }

        // var next = (controls.next) ? controls.next : '';


        // controls.sliderTop.on("reachEnd", function () {
        //     if (next) {
        //         var photos = jQuery(selectors.galleryPhotos + "[data-review-id=" + next + "]");
        //         var last = photos.last().next().data('review-id');

        //         for (var index = 0; index < photos.length; index++) {
        //             var sliderHtml = '<div class="photos-review__slide swiper-slide">' + photos[index].innerHTML + '</div>';
        //             controls.sliderTop.appendSlide(sliderHtml);
        //             controls.sliderThumbs.appendSlide(sliderHtml);
        //         }
        //         next = last;
        //     }
        //     console.log("reachEnd");
        // });

        // controls.sliderTop.on("slidePrevTransitionStart", function () {
        //     btnNext.find("i").removeClass("double");
        //     btnNext.removeAttr("title");
        //     console.log("slidePrevTransitionStart");
        // });

        // controls.sliderTop.on("slideNextTransitionStart", function () {
        //     btnPrev.find("i").removeClass("double");
        //     btnPrev.removeAttr("title");
        //     console.log("slideNextTransitionStart");
        // });

    }

};

module.exports = Slider;