var selectors = {
    form: ".user-review-reply.form",
    submit: ".user-review-reply.form .submit",
    userReviews: ".scr_user_reviews.comments",
    links: ".scr_user_reviews .comment .actions",
    replyLink: ".scr_user_reviews .comment .actions .reply_link",
    editLink: ".scr_user_reviews .comment .actions .reply_edit_link",
};

var Reply = {
    init: function() {
        this.eventListener();
    },
    eventListener: function() {
        this.showForm();
        this.formValidation();
    },

    showForm: function() {
        var thisModule = this;
        var links = jQuery(selectors.links);
        var replyLinks = jQuery(selectors.replyLink);
        var formClone = this.getFormClone();

        replyLinks.click(function() {
            var replyLink = jQuery(this);
            var author = replyLink
                .closest(".content")
                .find(".author")
                .first()
                .text()
                .trim();

            // Show all reviews list links
            links.show();

            // Remove all reviews list forms except clonned form
            jQuery(selectors.userReviews)
                .find("form.form")
                .remove();

            jQuery(".comment .content .text").show();
            // Hide clicked review link
            replyLink
                .parent()
                .parent()
                .hide();

            var parent = replyLink.closest(".comment").attr("id");
            // console.log(link.closest(".comment").find.children().length);
            var placeholder = "Reply to @" + author + " ...";

            jQuery(selectors.form).remove();

            /*  Append review reply form to comment content
                set a placeholder and a data-comement-parent-id attributes  */
            replyLink
                .closest(".comment .content .actions")
                .after(formClone)
                .next(selectors.form)
                .attr("data-comment-parent-id", parent)
                .find('[name="description"]')
                .attr("placeholder", placeholder);

            thisModule.formValidation();
            thisModule.cancelBtn();
        });
    },

    getFormClone: function() {
        var form = jQuery(selectors.form);
        var clone = form
            .clone()
            .wrap("<form class='" + selectors.form + "''>")
            .css("display", "block")
            .parent()
            .html();

        form.remove();

        return clone;
    },

    formValidation: function() {
        var thisModule = this;
        var replyForm = jQuery(selectors.form);
        var placeholderContent = this.getPlaceholderContent();

        jQuery(replyForm).form({
            fields: {
                description: "empty",
            },
            onSuccess: function(e, fields) {
                e.preventDefault();
                replyForm.replaceWith(placeholderContent);
                thisModule.submit(replyForm, fields);
            },
        });
    },

    cancelBtn: function() {
        var links = jQuery(selectors.links);
        jQuery(selectors.form + " .button.cancel").click(function(e) {
            e.preventDefault();
            links.show();
            jQuery(this)
                .closest("form.form")
                .remove();
        });
    },

    submit: function(form, fields) {
        var props = this.getProps(form, fields);
        // console.log(props);

        jQuery
            .post(scr_ajax.ajax_url, props, function(results) {
                results = JSON.parse(results);
                // console.log(results);
                jQuery("#" + results.props.comment_parent)
                    .find(".review_reply.placeholder")
                    .first()
                    .replaceWith(results.view);

                jQuery("#" + results.props.comment_id).transition("pulse");
            })
            .fail(function(response) {
                console.log("review_reply failed");
                console.log(response);
            });
    },

    getProps: function(submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("data-post-id");
        fields.parent = submittingForm.attr("data-comment-parent-id");

        return fields;
    },

    getPlaceholderContent: function() {
        var html = "";
        html += '<div class="ui review_reply placeholder" data-reply-token="">';
        html += '<div class="image header">';
        html += '<div class="line"></div>';
        html += '<div class="line"></div>';
        html += "</div>";

        return html;
    },
};

module.exports = Reply;
