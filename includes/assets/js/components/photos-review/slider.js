var Swiper = require('swiper').default;

var selectors = {
    sliderTop: ".photos-review-slider-top",
    sliderThumbs: ".photos-review-slider-thumbs",

    // Navigation
    btnPrev: ".photos-review__button-prev",
    btnNext: ".photos-review__button-next",

    reviewPhotos: ".review-photos .image",
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
            watchSlidesProgress: true,
        };

        new Swiper(selectors.sliderTop, sliderTopArgs);
    },

    showSlider: function (props) {

        Slider.addInitialSlides(props);

        if (props.type == 'gallery') {
            Slider.swiperListeners(props);
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

        // Destroy previous slider instance
        document.querySelector(selectors.sliderTop).swiper.destroy(true);
        document.querySelector(selectors.sliderThumbs).swiper.destroy(true);

        var sliderHTML = '';
        var wrapper = ' .photos-review-wrapper.swiper-wrapper';
        for (var index = 0; index < props.slides.length; index++) {
            sliderHTML += '<div class="photos-review__slide swiper-slide"  data-review-id="' + props.reviewID + '">' + props.slides[index].innerHTML + '</div>';
        }

        jQuery(selectors.sliderTop + wrapper).html(sliderHTML);
        jQuery(selectors.sliderThumbs + wrapper).html(sliderHTML);

        // Re-Initiate swiper slider after destroyed
        Slider.initSwiperSlider();

        // Remove Prevously added Double arrows
        Slider.removeDoubleArrows();
    },

    swiperListeners: function (props) {

        var prevSlidesReviewID = props.prev;
        var nextSlidesReviewID = props.next;


        // swiper instances
        var swiper = {
            sliderTop: document.querySelector(selectors.sliderTop).swiper,
            sliderThumbs: document.querySelector(selectors.sliderThumbs).swiper
        };


        // On Init
        if (prevSlidesReviewID) {
            prevSlidesReviewID = Slider.prependSlide(swiper, prevSlidesReviewID);
        }
        if (nextSlidesReviewID) {
            nextSlidesReviewID = Slider.appendSlide(swiper, nextSlidesReviewID);
        }

        Slider.removeDoubleArrows();
        Slider.addDoubleArrows();

        swiper.sliderTop.on("transitionStart", function () {
            Slider.removeDoubleArrows();
            Slider.addDoubleArrows();
        });

        swiper.sliderTop.on("reachBeginning", function () {
            if (prevSlidesReviewID) {
                prevSlidesReviewID = Slider.prependSlide(swiper, prevSlidesReviewID);
            }
        });

        swiper.sliderTop.on("reachEnd", function () {
            if (nextSlidesReviewID) {
                nextSlidesReviewID = Slider.appendSlide(swiper, nextSlidesReviewID);
            }
        });

        // Hide Slides excecpt Active Reviews
        swiper.sliderTop.on("slideChangeTransitionEnd", function () {
            Slider.hidesReviewSlides();

            // var activeSlide = jQuery(selectors.sliderTop + ' .swiper-slide.swiper-slide-active').data('review-id');
            // var notShownSlideIndex = [];

            // var activeReviewID = this.slides[this.realIndex].getAttribute('data-review-id');
            // console.log(activeReviewID);
            // console.log('swiper.realIndex' + this.realIndex);
            // var activeElementSlide = '';
            // for (var index = 0; index < this.slides.length; index++) {
            //     if (this.slides[index].getAttribute('data-review-id') !== activeReviewID) {
            //         notShownSlideIndex.push(index);
            //     }
            // }
            // console.log(notShownSlideIndex);
            // swiper.sliderTop.removeSlide(notShownSlideIndex);
            // swiper.sliderThumbs.removeSlide(notShownSlideIndex);
            // jQuery(selectors.sliderThumbs + ' .swiper-slide').hide();
            // jQuery(selectors.sliderThumbs + " [data-review-id=" + activeSlide + "]").css('display', 'flex');
        });


        swiper.sliderThumbs.on("setTranslate", function (translate) {
            var thisContext = this;
            if (document.documentElement.clientWidth < 600) {
                setTimeout(function () {
                    thisContext.setTranslate(0);
                }, 1);
            }
        });

    },

    appendSlide: function (swiper, nextSlidesReviewID) {
        var photos = jQuery(selectors.galleryPhotos + "[data-review-id=" + nextSlidesReviewID + "]");
        var nextReview = photos.last().next().data('review-id');

        for (var index = 0; index < photos.length; index++) {
            var sliderHTML = '<div class="photos-review__slide swiper-slide" data-review-id="' + nextSlidesReviewID + '">' + photos[index].innerHTML + '</div>';

            swiper.sliderTop.appendSlide(sliderHTML);
            swiper.sliderThumbs.appendSlide(sliderHTML);
        }

        jQuery(selectors.sliderThumbs + " [data-review-id=" + nextSlidesReviewID + "]").hide();

        return nextReview;
    },

    prependSlide: function (swiper, prevSlidesReviewID) {
        // console.log("reachBeginning");
        // console.log("prevSlidesReviewID : " + prevSlidesReviewID);

        var photos = jQuery(selectors.galleryPhotos + "[data-review-id=" + prevSlidesReviewID + "]");
        var prevReview = photos.first().prev().data('review-id');

        // Slides are prepending in Left
        photos = photos.get().reverse();

        for (var index = 0; index < photos.length; index++) {
            var sliderHTML = '<div class="photos-review__slide swiper-slide" data-review-id="' + prevSlidesReviewID + '">' + photos[index].innerHTML + '</div>';

            swiper.sliderTop.prependSlide(sliderHTML);
            swiper.sliderThumbs.prependSlide(sliderHTML);
        }

        jQuery(selectors.sliderThumbs + " [data-review-id=" + prevSlidesReviewID + "]").hide();

        // Go to active Slide
        setTimeout(function () {
            swiper.sliderTop.slideTo(photos.length);
        }, 1);

        return prevReview;
    },

    // Add double arrow for Prev / Next Review navigation
    addDoubleArrows: function () {
        var activeSlide = jQuery(selectors.sliderTop + ' .swiper-slide.swiper-slide-active').data('review-id');
        var photos = jQuery(selectors.sliderThumbs + " [data-review-id=" + activeSlide + "]");

        var btnPrev = jQuery(selectors.btnPrev);
        var btnNext = jQuery(selectors.btnNext);

        if (photos.first().hasClass('swiper-slide-thumb-active')) {
            btnPrev.find("i").addClass("double");
            btnPrev.attr("title", "Previous Review");
        }
        if (photos.last().hasClass('swiper-slide-thumb-active')) {
            btnNext.find("i").addClass("double");
            btnNext.attr("title", "Next Review");
        }
    },

    removeDoubleArrows: function () {
        var btnPrev = jQuery(selectors.btnPrev);
        var btnNext = jQuery(selectors.btnNext);

        btnPrev.find("i").removeClass("double");
        btnPrev.removeAttr("title");

        btnNext.find("i").removeClass("double");
        btnNext.removeAttr("title");
    },

    hidesReviewSlides: function () {
        var activeSlide = jQuery(selectors.sliderTop + ' .swiper-slide.swiper-slide-active').data('review-id');
        jQuery(selectors.sliderThumbs + ' .swiper-slide').hide();
        jQuery(selectors.sliderThumbs + " [data-review-id=" + activeSlide + "]").css('display', 'flex');
    }

};

module.exports = Slider;