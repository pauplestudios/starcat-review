var selectors = {
    upload: "#scr_pr_image_upload",
    maxFiles: "#scr_pr_max_files",
    uploadedImagesGroup: ".scr_pr_uploaded_image_group",
    removeImgesLink: ".scr_pr_uploaded_image_group .deleteable.image a",
    openUploadWindow: ".add-photos"
};

var Upload = {

    init: function () {
        this.eventHandlers();
        // this.backendUpload();
        this.openUploadWindow();
    },

    openUploadWindow: function () {
        jQuery(selectors.openUploadWindow).on('click', function (e) {
            // console.log();
            jQuery('#' + jQuery(this).attr("for")).click();
        });

        // jQuery('input:file', '.ui.action.input').on('change', function (e) {
        //     var name = e.target.files[0].name;
        //     jQuery('input:text', jQuery(e.target).parent()).val(name);
        // });
    },

    eventHandlers: function () {
        jQuery(selectors.upload).change(function (e) {

            var imagesGroup = jQuery(selectors.uploadedImagesGroup);
            var maxFiles = jQuery(selectors.maxFiles).val();
            // imagesGroup.html(""); // Emptied on every Upload
            imagesGroup.find(".ui.tiny.fluid.image").remove();
            for (var index = 0; index < e.target.files.length; index++) {
                var src = URL.createObjectURL(e.target.files[index]);
                imagesGroup.prepend(Upload.getImageHTML(src));
            }

        });
        Upload.removeImage();
    },

    getImageHTML: function (src) {
        var html = "<div class='ui tiny fluid image'>";
        // html += "<a class='ui right corner label'><i class='delete icon'></i></a>";
        html += "<img src='" + src + "' />";
        html += "</div>";

        return html;
    },

    removeImage: function () {
        jQuery(selectors.removeImgesLink).click(function () {
            if (confirm("Are you sure want to delete this attachment from the review ?")) {
                var attachment = jQuery(this);
                console.log('Review ID : ' + attachment.parent().data('review-id'));
                console.log('Attachment ID : ' + attachment.parent().data('attachment-id'));

                props = {
                    action: "scr_pr_delete_attachment",
                    review_id: attachment.parent().data('review-id'),
                    attachment_id: attachment.parent().data('attachment-id'),
                };

                console.log("@@@ Deleting Attachment Props @@@");
                console.log(props);

                jQuery.post(scr_ajax.ajax_url, props, function (results) {
                    attachment.parent().fadeOut(300, function () {
                        jQuery(this).remove();
                    });
                });
            }
        });
    },

    backendUpload: function () {
        // Set all variables to be used in scope
        var frame,
            addImgLink = jQuery(selectors.upload),
            imgContainer = jQuery(selectors.uploadedImagesGroup);

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
                        imgContainer.append('<div class="wcpr-review-image-container"><a href="' + attachment_url + '" data-lightbox="photo-reviews-' + jQuery('#comment_ID').val() + '" data-img_post_id="' + attachment[i].id + '"><img style="border: 1px solid;" class="review-images" src="' + attachment_url + '"/></a><input class="photo-reviews-id" name="photo-reviews-id[]" type="hidden" value="' + attachment[i].id + '"/><a href="#" class="wcpr-remove-image">Remove</a></div>');
                    }
                }
            });
        });
    }
};

module.exports = Upload;
