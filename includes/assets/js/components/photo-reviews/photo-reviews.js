
var Slider = require("./slider.js");
var Gallery = require("./gallery.js");
var Upload = require("./upload.js");

var PhotosReview = {
    init: function () {
        Slider.init();
        Gallery.init();
        Upload.init();
    },
};

module.exports = PhotosReview;