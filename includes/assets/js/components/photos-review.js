var Swiper = require('swiper').default;

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

        var galleryThumbs = new Swiper('.gallery-thumbs', {
            spaceBetween: 15,
            slidesPerView: 3,
            freeMode: true,
            // watchSlidesVisibility: true,
            // watchSlidesProgress: true,
        });
        var galleryTop = new Swiper('.gallery-top', {
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: galleryThumbs
            }
        });
    }
};

module.exports = PhotosReview;