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
        this.initSwiperSliders();
        // this.goToNextReviewSlides();
        // this.goToPrevReviewSlides();
    },

    goToNextReviewSlides: function (nextReviewSlides) {
        // console.log("goToNextReviewSlides Method");
        jQuery(selectors.btnNext+ '.next-review-slides').unbind();
        jQuery(selectors.btnNext + '.next-review-slides').click(function (e) {
            // console.log("goToNextReviewSlides");
            e.preventDefault();
            var nextSlidesGroup = (nextReviewSlides)? nextReviewSlides: jQuery(this).data('review-id');
            console.log("Next slides pHotos Group review-id: " + nextSlidesGroup);
            var group = jQuery(selectors.galleryPhotos + "[data-review-id=" + nextSlidesGroup + "]");
            var slides = {
                prev: group.first().prev().data('review-id'),
                next: group.last().next().data('review-id'),
                slides: group
            };
            console.log("!!! Next Slides Controls !!!");
            console.log(slides);
            Slider.addSlideControls(slides);
        });
    },

    goToPrevReviewSlides: function () {
        jQuery(selectors.btnPrev + ' .double.icon').unbind();
        jQuery(selectors.btnPrev + ' .double.icon').click(function () {
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

        var btnPrev = jQuery(selectors.btnPrev);
        var btnNext = jQuery(selectors.btnNext);

        if (controls.prev) {
            // console.log(controls.prev);
            controls.sliderTop.on("reachBeginning", function () {
                // console.log("reachBeginning");
                btnPrev.find("i").addClass("double");
                btnPrev.attr("title", "Previous Review");
                btnPrev.attr("data-review-id", controls.prev);
                setTimeout(function () {
                    btnPrev.removeClass(selectors.btnDisable);
                }, 5);
            });
        }

        if (controls.next) {
            // console.log(controls.next);

            controls.sliderTop.on("reachEnd", function () {
                // console.log("reachEnd");
                btnNext.addClass("next-review-slides")
                btnNext.find("i").addClass("double");
                btnNext.attr("title", "Next Review");
                btnNext.attr("data-review-id", controls.next);

                setTimeout(function () {
                    btnNext.removeClass(selectors.btnDisable);
                }, 5);

                Slider.goToNextReviewSlides(controls.next);
            });
        }

        controls.sliderTop.on("slidePrevTransitionStart", function () {
            btnNext.removeClass("next-review-slides");
            btnNext.find("i").removeClass("double");
            btnNext.removeAttr("title");
            // console.log("slidePrevTransitionStart");
        });

        controls.sliderTop.on("slideNextTransitionStart", function () {
            btnPrev.find("i").removeClass("double");
            btnPrev.removeAttr("title");
            // console.log("slideNextTransitionStart");
        });

        
        // Slider.goToPrevReviewSlides();
    }

};

module.exports = Slider;