var Stats = require("./stats.js");
var Upload = require("./../photo-reviews/upload.js");

var selectors = {
    reviewForm: ".scr-user-review.form",
    links: ".scr_user_reviews .comment .actions",
    editLink: ".scr_user_reviews .comment .actions .edit_link",
};

var Edit = {
    init: function () {
        this.eventListener();
    },
    eventListener: function () {
        this.showForm();
    },

    showForm: function () {
        var thisModule = this;
        var editlinks = jQuery(selectors.editLink);
        var links = jQuery(selectors.links);

        editlinks.click(function () {
            var link = jQuery(this);

            // Show all reviews list links
            links.show();

            // Hide clicked review link
            link.parent()
                .parent()
                .hide();

            jQuery(".comment .content .text").show();

            // Clicked link closest review content

            var allReviewContent = link
                .closest(".comment .content")
                .find(".text").show();
            var reviewContent = allReviewContent.first();

            // Hide clicked link of closest review content
            reviewContent.hide();

            // Forms attributes and show the form
            var form = jQuery(selectors.reviewForm);
            var commentProps = reviewContent.closest(".comment").data("props");

            form.attr("data-comment-id", reviewContent.closest(".comment").attr("id"));
            form = Edit.modifyFormForEditing(form, commentProps, reviewContent);

            // Append clonned edit form into closest review content of clicked edit link
            reviewContent.after(form).next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);

            Stats.init();
            // thisModule.editFormSubmit(reviewContent, reviewProps);

        });
    },

    modifyFormForEditing: function (form, props, content) {
        var sumbitBtn = '<div class="ui blue submit mini button">Save</div>';
        var cancelBtn = '<div class="ui cancel mini button">Cancel</div>';

        props.title = content.find('.title').text().trim();
        props.description = content.find('.description').text().trim();

        form.addClass('mini');
        form.attr("data-method", "PUT");
        form.find('h2.ui.header').remove();
        form.find("h5").addClass("ui tiny header");
        form.find('[name="title"]').val(props.title);
        form.find('[name="description"]').val(props.description);
        form.find(".submit.button").closest('.field').html(sumbitBtn + cancelBtn);
        form.show();

        // Non-logged-in Users
        // form.find('[name="user_name"]').attr("disabled", "");
        // form.find('[name="user_email"]').attr("disabled", "");
        // form.find('[name="website"]').attr("disabled", "");

        // Stats
        Edit.getModifiedFormforStats(props, form);
        // ProsandCons 
        Edit.getModifiedFormforProsandCons(props, form, 'pros');
        Edit.getModifiedFormforProsandCons(props, form, 'cons');
        // Attachments
        Edit.getModifiedFormforPhotos(props, form);

        return form;
    },

    getModifiedFormforStats: function (props, form) {
        if (props.stats) {
            form.find('.review-list li').each(function () {
                var item = jQuery(this);
                var stat = props.stats[item.find('.review-item-label__text').text().trim()];
                if (!stat) {
                    item.remove();
                }
                jQuery(this).find('.stars-result').css('width', stat + '%');
                var score = Stats.getStatScore(stat, Stats.getProps());
                item.find('.stars-result').width(stat + "%");
                item.find('input').val(stat);
                item.find('.review-item-stars').attr('result', stat);
                item.find('.review-item-label__score').text(score);
            });
        }
    },

    getModifiedFormforProsandCons: function (props, form, listname) {
        if (props.prosandcons && props.prosandcons[listname + '-list'].length > 1) {
            for (var ii = 1; ii < props.prosandcons[listname + '-list'].length; ii++) {
                form.find('.review-' + listname + '-repeater [data-repeater-create]').trigger("click");
            }
        }

        var index = 0;
        form.find('.review-' + listname + '-repeater [data-repeater-item]').each(function () {
            if (props.prosandcons && props.prosandcons[listname + '-list'][index]) {
                jQuery(this).find(".prosandcons").dropdownX("set text", props.prosandcons[listname + '-list'][index].item);
            } else {
                jQuery(this).find("[data-repeater-delete]").trigger("click");
            }
            index++;
        });
    },

    getModifiedFormforPhotos: function (props, form) {


        if (props.attachments && props.attachments.length && form.find(".scr_pr_uploaded_image_group").length == 1) {
            jQuery(props.attachments).each(function () {
                var attachment = this;
                var html = "<div class='ui tiny deleteable image' data-review-id='" + attachment.review_id + "' data-attachment-id='" + attachment.id + "'>";
                html += "<a class='ui right corner red label'><i class='delete icon'></i></a>";
                html += "<img src='" + attachment.url + "' />";
                html += "</div>";

                form.find(".scr_pr_uploaded_image_group").prepend(html);
            });
            Upload.removePhoto();
        }
    },

    cancelBtn: function (reviewContent) {
        var links = jQuery(selectors.links);
        jQuery(selectors.reviewForm + " .button.cancel").click(function (e) {
            e.preventDefault();

            links.show();
            reviewContent.show();

            jQuery(this)
                .closest("form.form")
                .hide();
        });
    },
};

module.exports = Edit;
