var selectors = {
    photos: ".scr_pr_uploaded_image_group .deleteable.image",
    addPhotos: ".add-photos",
    maxFilesField: "#scr_pr_max_files",
    removePhotoLink: ".scr_pr_uploaded_image_group .deleteable.image a",
    uploadHiddenField: "#scr_pr_image_upload",
    photosPreviewGroup: ".scr_pr_uploaded_image_group",
};

var Upload = {

    init: function () {
        this.eventHandlers();
    },

    eventHandlers: function () {
        Upload.addPhotos();
        Upload.photoPreview();
        Upload.removePhoto();
    },

    // Used In for Edit forms
    getEditFormPhotos: function (props, form) {

        if (props.attachments && props.attachments.length && form.find(".scr_pr_uploaded_image_group .add-photos")[0]) {
            var photosHTML = '';
            var addPhotoHTMl = form.find(".scr_pr_uploaded_image_group .add-photos")[0].outerHTML;
            jQuery(props.attachments).each(function () {
                var attachment = this;
                photosHTML += "<div class='ui tiny deleteable image' data-review-id='" + attachment.review_id + "' data-attachment-id='" + attachment.id + "'>";
                photosHTML += "<a class='ui right corner red label'><i class='delete icon'></i></a>";
                photosHTML += "<img src='" + attachment.url + "' />";
                photosHTML += "</div>";
            });
            form.find(".scr_pr_uploaded_image_group").html(photosHTML + addPhotoHTMl);
            Upload.addPhotos();
            Upload.removePhoto();
            Upload._showOrHideAddPhotosField();
        }
    },

    addPhotos: function () {
        jQuery(selectors.addPhotos).on('click', function (e) {
            jQuery('#' + jQuery(this).attr("for")).click();
        });

        Upload._showOrHideAddPhotosField();
    },

    photoPreview: function () {
        jQuery(selectors.uploadHiddenField).change(function (e) {

            var previewGroup = jQuery(selectors.photosPreviewGroup);
            previewGroup.find(".ui.tiny.fluid.image").remove();
            for (var index = 0; index < e.target.files.length; index++) {
                var src = URL.createObjectURL(e.target.files[index]);
                previewGroup.prepend(Upload._getImageHTML(src));
            }

        });
    },

    removePhoto: function () {
        jQuery(selectors.removePhotoLink).click(function () {
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
                        Upload._showOrHideAddPhotosField();
                    });
                });
            }
        });
    },

    _getImageHTML: function (src) {
        var html = "<div class='ui tiny fluid image'>";
        // html += "<a class='ui right corner label'><i class='delete icon'></i></a>";
        html += "<img src='" + src + "' />";
        html += "</div>";

        return html;
    },

    _showOrHideAddPhotosField: function () {
        var addPhotos = jQuery(selectors.addPhotos);
        var maxFiles = jQuery(selectors.maxFilesField).val();
        var photos = jQuery(selectors.photos).length;
        console.log('maxFiles : ' + maxFiles);
        console.log('attachments : ' + photos);

        addPhotos.show();
        if (photos >= maxFiles) {
            addPhotos.hide();
        }
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
