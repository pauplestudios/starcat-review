var Modal = require("./modal.js");
var selectors = {
    preview: ".all-photos-gallery-preview",
    showGallery: ".show-all-photos-gallery",
    gallery: ".all-photos-gallery",

    modal: "#photos-review-modal",
    modal_deny: "#photos-review-modal .close.icon",
};

var Gallery = {
    init: function () {
        Modal.init(selectors.modal, selectors.modal_deny);
        this.eventHandler();
    },

    eventHandler: function () {
        this.galleryPreview();
    },

    galleryPreview: function () {
        var thisModule = this;

        jQuery(selectors.showGallery).click(function () {
            Modal.show(selectors.modal);
            jQuery('.all-photos-gallery .card img.image')
                .visibility({
                    type: 'image',
                    transition: 'fade in',
                    duration: 3000
                });

                thisModule.makePlaceholder();
            // console.log("Show PHotos reviews Modal");
        });

        data = {
            action: "get_all_photos"
        };

        jQuery(selectors.modal + ' .scrolling.content').scroll(function () {
            if (this.offsetHeight + this.scrollTop == this.scrollHeight) {
                // jQuery.post(scr_ajax.ajax_url, data, function () {

                // });
            }
        });
    },
    makePlaceholder: function(){
        var shownElement = jQuery(selectors.showGallery);
        var gallery = jQuery(selectors.gallery);

        var limit = shownElement.data("limit");
        var shownCount = shownElement.data("shown-count");
        var totalCount = shownElement.data("total-count");

        console.log('Shown Count : ' + shownCount);
        console.log('Total Count : ' + totalCount);
        console.log('limit : ' + limit);
        var cardHTML = '';
        for (var index = 0; index < limit; index++) {
            cardHTML += this.cardPlaceholderHtml();
            
        }
        gallery.append(cardHTML);

    },

    cardPlaceholderHtml: function(){
        var html = '<div class="card">';            
            html += '<div class="ui placeholder">';
            html += '<div class="image"></div>';            
            html += '</div>';   
            html += '</div>';  
        return html;
    }


};

module.exports = Gallery;