
var Gallery = require("./gallery.js");
var Slider = require("./slider.js");

var PhotosReview = {
    init: function () {
        Slider.init();
        Gallery.init();
    },
};

module.exports = PhotosReview;