var Selectors = {
    upload: "#scr_pr_image_upload",
    uploadedImagesGroup: ".scr_pr_uploaded_image_group",
    removeImgesLink: ".scr_pr_uploaded_image_group .image a"
};

var Upload = {

    init: function () {
        this.eventHandlers();
    },

    eventHandlers: function () {
        jQuery(Selectors.upload).change(function (e) {

            var imagesGroup = jQuery(Selectors.uploadedImagesGroup);

            imagesGroup.html(""); // Emptied on every Upload

            for (var index = 0; index < e.target.files.length; index++) {
                var src = URL.createObjectURL(e.target.files[index]);
                imagesGroup.append(Upload.getImageHTML(src));
                Upload.removeImg();
            }
        });
    },

    getImageHTML: function (src) {
        var html = "<div class='ui tiny fluid image'>";
        html += "<a class='ui right corner label'><i class='delete icon'></i></a>";
        html += "<img src='" + src + "' />";
        html += "</div>";

        return html;
    },

    removeImg: function () {
        jQuery('.images .image a').click(function () {
            console.log("this Image");
            console.log(this);
            jQuery(this).parent().remove();
        });
    },

    backendUpload: function () {
        // Set all variables to be used in scope
        var frame,
            metaBox = $('#wcpr-comment-photos'), // Your meta box id here
            addImgLink = metaBox.find('.wcpr-upload-custom-img'),
            imgContainer = metaBox.find('#wcpr-new-image');

        // ADD IMAGE LINK
        addImgLink.on('click', function (event) {
            event.preventDefault();

            // If the media frame already exists, reopen it.
            if (frame) {
                frame.open();
                return;
            }

            // Create a new media frame
            frame = wp.media({
                title: 'Select or Upload Media Of Your Chosen Persuasion',
                button: {
                    text: 'Use this media'
                },
                multiple: true  // Set to true to allow multiple files to be selected
            });


            // When an image is selected in the media frame...
            frame.on('select', function () {

                // Get media attachment details from the frame state
                var attachment = frame.state().get('selection').toJSON();
                var attachment_url;
                if (attachment.length > 0) {
                    for (var i = 0; i < attachment.length; i++) {
                        if (attachment[i].sizes.thumbnail) {
                            attachment_url = attachment[i].sizes.thumbnail.url;
                        } else if (attachment[i].sizes.medium) {
                            attachment_url = attachment[i].sizes.medium.url;
                        } else if (attachment[i].sizes.large) {
                            attachment_url = attachment[i].sizes.large.url;
                        } else if (attachment[i].url) {
                            attachment_url = attachment[i].url;
                        }
                        // Send the attachment[i] URL to our custom image input field.
                        imgContainer.append('<div class="wcpr-review-image-container"><a href="' + attachment_url + '" data-lightbox="photo-reviews-' + $('#comment_ID').val() + '" data-img_post_id="' + attachment[i].id + '"><img style="border: 1px solid;" class="review-images" src="' + attachment_url + '"/></a><input class="photo-reviews-id" name="photo-reviews-id[]" type="hidden" value="' + attachment[i].id + '"/><a href="#" class="wcpr-remove-image">Remove</a></div>');
                    }
                }
            });
        });
    }
};

module.exports = Upload;
