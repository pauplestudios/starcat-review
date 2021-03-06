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

        editlinks.on("click", function (e) {
            var link = jQuery(this);

            // Forms attributes and show the form
            // var form = jQuery(selectors.reviewForm);
            var form = thisModule.getReviewForm();
            if (form == false) {
                e.preventDefault();
                return false;
            }

            // pluck the current post scr_user_reviews element
            var userReviews = jQuery(this).closest(".scr_user_reviews");
            // Get post-ID
            var postID = userReviews.attr("data-post-id");

            // Show all reviews list links
            links.show();

            // Hide clicked review link
            link.parent().parent().hide();

            jQuery(".comment .content .text").show();

            // Clicked link closest review content

            var allReviewContent = link
                .closest(".comment .content")
                .find(".text")
                .show();
            var reviewContent = allReviewContent.first();
            // Hide clicked link of closest review content
            reviewContent.hide();

            // set form post_id
            form.attr("post_id", postID);
            form.attr("data-post-id", postID);
            var commentProps = reviewContent.closest(".comment").data("props");

            form.attr(
                "data-comment-id",
                reviewContent.closest(".comment").attr("id")
            );
            form = Edit.modifyFormForEditing(form, commentProps, reviewContent);

            // Append clonned edit form into closest review content of clicked edit link
            reviewContent.after(form).next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);

            Stats.init();
            // thisModule.editFormSubmit(reviewContent, reviewProps);
        });
    },

    modifyFormForEditing: function (form, props, content) {
        var sumbitBtn =
            '<div class="ui blue submit mini button">' +
            Translations.save +
            "</div>";
        var cancelBtn =
            '<div class="ui cancel mini button">' +
            Translations.cancel +
            "</div>";

        props.title = content.find(".title").text().trim();
        props.description = content.find(".description").text().trim();

        form.addClass("mini");
        form.attr("data-method", "PUT");
        form.find("h2.ui.header").remove();
        form.find("h5").addClass("ui tiny header");
        form.find('[name="title"]').val(props.title);
        form.find('[name="description"]').val(props.description);
        form.find(".submit.button")
            .closest(".field")
            .html(sumbitBtn + cancelBtn);
        form.show();

        // Non-logged-in Users
        var name =
            props.user["name"] &&
            props.user["name"] != Translations["anonymous"]
                ? props.user["name"]
                : form.find('[name="name"]').val();
        var email = props.user["email"]
            ? props.user["email"]
            : form.find('[name="email"]').val();
        var website = props.user["website"]
            ? props.user["website"]
            : form.find('[name="website"]').val();

        form.find('[name="name"]').val(name);
        form.find('[name="email"]').val(email);
        form.find('[name="website"]').val(website);

        // Stats
        Edit.getModifiedFormforStats(props, form);
        // ProsandCons
        Edit.getModifiedFormforProsandCons(props, form, "pros");
        Edit.getModifiedFormforProsandCons(props, form, "cons");
        // Attachments
        Edit.getModifiedFormforPhotos(props, form);

        return form;
    },

    getModifiedFormforStats: function (props, form) {
        if (props.stats) {
            form.find(".review-list li").each(function () {
                var item = jQuery(this);
                var stat =
                    props.stats[
                        item.find(".review-item-label__text").text().trim()
                    ];
                if (!stat) {
                    item.remove();
                }
                jQuery(this)
                    .find(".stars-result")
                    .css("width", stat + "%");
                var score = Stats.getStatScore(stat, Stats.getProps());
                item.find(".stars-result").width(stat + "%");
                Stats.addStatClassesBasedOnScore(item, score);
                item.find("input").val(stat);
                item.find(".review-item-stars").attr("result", stat);
                item.find(".review-item-label__score").text(score);
            });
        }
    },

    getModifiedFormforProsandCons: function (props, form, listname) {
        // Creating Fieald by triggering click event
        if (
            props.prosandcons &&
            props.prosandcons[listname + "-list"] &&
            props.prosandcons[listname + "-list"].length > 1
        ) {
            for (
                var ii = 1;
                ii < props.prosandcons[listname + "-list"].length;
                ii++
            ) {
                form.find(
                    ".review-" + listname + "-repeater [data-repeater-create]"
                ).trigger("click");
            }
        }

        // Delete field if Empty
        var index = 0;
        form.find(
            ".review-" + listname + "-repeater [data-repeater-item]"
        ).each(function () {
            if (
                props.prosandcons &&
                props.prosandcons[listname + "-list"] &&
                props.prosandcons[listname + "-list"][index]
            ) {
                var collectionOptions = form
                    .find(".review-" + listname + "-repeater")
                    .attr("data-" + listname);
                var itemOptions = props.prosandcons[listname + "-list"];
                var values = Edit.getProsandConsOptions(
                    collectionOptions,
                    itemOptions
                );
                var prosAndConsField = jQuery(this).find(".prosandcons");

                prosAndConsField.dropdownX("change values", values);
                prosAndConsField.dropdownX(
                    "set text",
                    props.prosandcons[listname + "-list"][index].item
                );
                prosAndConsField.dropdownX(
                    "set selected",
                    props.prosandcons[listname + "-list"][index].item
                );
            } else {
                jQuery(this).find("[data-repeater-delete]").trigger("click");
            }
            index++;
        });
    },

    getProsandConsOptions: function (collectionOptions, itemOptions) {
        var values = [];
        collectionOptions = JSON.parse(collectionOptions);

        // get options of unique values only
        var options = itemOptions.concat(
            collectionOptions.filter(function (el) {
                var result = true;
                for (var ii in itemOptions) {
                    if (itemOptions[ii].item === el.item) {
                        result = false;
                    }
                }
                return result;
            })
        );

        for (var i = 0, len = options.length; i < len; i++) {
            values[i] = {
                value: options[i].item,
                name: options[i].item,
            };
        }

        return values;
    },

    getModifiedFormforPhotos: function (props, form) {
        Upload.getEditFormPhotos(props, form);
    },

    cancelBtn: function (reviewContent) {
        var links = jQuery(selectors.links);
        jQuery(selectors.reviewForm + " .button.cancel").click(function (e) {
            e.preventDefault();

            links.show();
            reviewContent.show();

            jQuery(this).closest("form.form").hide();
        });
    },
    getReviewForm: function () {
        var noOfForms = jQuery(selectors.reviewForm).length;
        if (noOfForms == 0) {
            return false;
        }
        if (noOfForms == 1) {
            return jQuery(selectors.reviewForm);
        }
        return jQuery(selectors.reviewForm).first();
    },
};

module.exports = Edit;
