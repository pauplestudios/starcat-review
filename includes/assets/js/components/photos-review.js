var Swiper = require('swiper').default;

var selectors = {
    modal: "#photos-review-modal.",

    slide: ".scr-photos-review .photos-review__slide",
    wrapper: ".scr-photos-review .photos-review-wrapper",
    btnPrev: ".scr-photos-review .photos-review__button-prev",
    btnNext: ".scr-photos-review .photos-review__button-next",
    galleryTop: ".photos-review-gallery-top",
    galleryThumbs: ".photos-review-gallery-thumbs",

    allPhotosList: ".scr-photos-review .all-photos-list",
    reviewPhotosList: ".scr-photos-review .review-photos-list"
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

        this.eventHandler();
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
        // console.log(Swiper);
        // var mySwiper = new Swiper.default('.swiper-container', {
        //     loop: true,
        //     // If we need pagination
        //     pagination: {
        //         el: '.swiper-pagination',
        //     },

        //     // Navigation arrows
        //     navigation: {
        //         nextEl: '.swiper-button-next',
        //         prevEl: '.swiper-button-prev',
        //     },

        //     // And if we need scrollbar
        //     // scrollbar: {
        //     //     el: '.swiper-scrollbar',
        //     // },
        // });


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
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            keyboard: {
                enabled: true,
            },
        };

        var swiperNamespaceClasses = thisModule.getSwiperNamespaceClasses();
        galleryTopArgs = Object.assign(swiperNamespaceClasses, galleryTopArgs);
        galleryThumbsArgs = Object.assign(swiperNamespaceClasses, galleryThumbsArgs);

        console.log(galleryTopArgs);
        console.log(galleryThumbsArgs);

        var galleryThumbs = new Swiper(selectors.galleryThumbs, galleryThumbsArgs);
        var galleryTop = new Swiper(selectors.galleryTop, galleryTopArgs);

        /* set conteoller  */
        galleryTop.controller.control = galleryThumbs;
        galleryThumbs.controller.control = galleryTop;

    },

    getSwiperNamespaceClasses: function () {
        return {
            containerModifierClass: "photos-review-container",
            slideClass: "photos-review__slide",
            slideActiveClass: "photos-review__slide-active",
            slidePrevClass: "photos-review__slide-prev",
            slideNextClass: "photos-review__slide-next",
            wrapperClass: "photos-review-wrapper",
        };
    }
};

module.exports = PhotosReview;