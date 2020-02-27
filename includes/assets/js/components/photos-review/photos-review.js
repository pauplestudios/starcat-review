
var Slider = require("./slider.js");
var Gallery = require("./gallery.js");

var PhotosReview = {
    init: function () {
        Slider.init();
        Gallery.init();
    },
};

module.exports = PhotosReview;