
var Gallery = require("./gallery.js");
var Slider = require("./slider.js");

var PhotosReview = {
    init: function () {
        Gallery.init();
        Slider.init();
    },
};

module.exports = PhotosReview;