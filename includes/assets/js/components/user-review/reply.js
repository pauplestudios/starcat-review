var selectors = {
    replyForm: ".user-review-reply.form",
    submit: ".user-review-reply.form .submit",
    userReviews: ".scr_user_reviews.comments",
    links: ".scr_user_reviews .comment .actions",
    replyLink: ".scr_user_reviews .comment .actions .reply_link",
    editLink: ".scr_user_reviews .comment .actions .reply_edit_link",
};

var Reply = {
    init: function () {
        this.eventListener();
    },
    eventListener: function () {
        this.showForm();
        this.formValidation();
    },

    showForm: function () {
        var thisModule = this;
        var links = jQuery(selectors.links);
        var replyLinks = jQuery(selectors.replyLink);
        var editLinks = jQuery(selectors.editLink);
        var formClone = this.getFormClone();

        replyLinks.click(function () {
            var replyLink = jQuery(this);
            var author = replyLink
                .closest(".content")
                .find(".author")
                .first()
                .text()
                .trim();

            // Show all reviews list links
            links.show();

            jQuery(".comment .content .text").show();
            // Hide clicked review link
            replyLink
                .parent()
                .parent()
                .hide();

            var parent = replyLink.closest(".comment").attr("id");
            // console.log(link.closest(".comment").find.children().length);
            var placeholder = Translations.replyto + " @" + author + " ...";

            jQuery(selectors.replyForm).remove();

            /*  Append review reply form to comment content
                set a placeholder and a data-comement-parent-id attributes  */
            replyLink
                .closest(".comment .content .actions")
                .after(formClone)
                .next(selectors.replyForm)
                .attr("data-comment-parent-id", parent)
                .find('[name="description"]')
                .attr("placeholder", placeholder);

            thisModule.formValidation();
            thisModule.cancelBtn("");
        });

        editLinks.click(function () {
            var editForm = thisModule.getEditForm(formClone);
            var editLink = jQuery(this);
            var author = editLink
                .closest(".content")
                .find(".author")
                .first()
                .text()
                .trim();

            // Show all reviews list links
            links.show();

            // Remove all reviews list forms except clonned form
            jQuery(selectors.userReviews)
                .find(".form").hide().find(selectors.replyForm)
                .remove();

            // Hide clicked review link
            editLink
                .parent()
                .parent()
                .hide();

            jQuery(".comment .content .text").show();
            // Clicked link closest review content
            var reviewContent = editLink
                .closest(".comment .content")
                .find(".text")
                .first();

            // Hide clicked link of closest review content
            reviewContent.hide();

            var parent = editLink
                .parent()
                .closest(".comment")
                .attr("data-comment-parent-id");

            var placeholder = Translations.replyto + " @" + author + " ...";

            jQuery(selectors.replyForm).remove();

            var editProps = {
                comment_id: reviewContent.closest(".comment").attr("id"),
                description: reviewContent.text().trim(),
                methodType: "PUT",
                reviewContent: reviewContent,
            };
            // Append clonned edit form into closest review content of clicked edit link
            reviewContent
                .after(editForm)
                .next(selectors.replyForm)
                .attr("data-comment-parent-id", parent)
                .attr("data-comment-id", editProps.comment_id)
                .attr("data-method", "PUT")
                .find('[name="description"]')
                .attr("placeholder", placeholder)
                .attr("value", editProps.description);

            thisModule.submitEditForm(editProps);
            thisModule.cancelBtn(reviewContent);
        });
    },

    getEditForm: function (formClone) {
        editForm = jQuery(formClone);
        editForm
            .find(".submit.button")
            .addClass("blue")
            .text(Translations.save);

        return editForm[0].outerHTML;
    },

    getFormClone: function () {
        var form = jQuery(selectors.replyForm);
        var clone = form
            .clone()
            .wrap("<form class='" + selectors.replyForm + "''>")
            .css("display", "block")
            .parent()
            .html();

        form.remove();

        return clone;
    },

    formValidation: function () {
        var thisModule = this;
        var replyForm = jQuery(selectors.replyForm);
        var placeholderContent = this.getPlaceholderContent();

        jQuery(replyForm).form({
            fields: {
                description: "empty",
            },
            onSuccess: function (e, fields) {
                e.preventDefault();
                jQuery(selectors.links).show();
                replyForm.replaceWith(placeholderContent);
                thisModule.submit(replyForm, fields);
            },
        });
    },

    submitEditForm: function (editProps) {
        var thisModule = this;
        var replyForm = jQuery(selectors.replyForm);
        var links = jQuery(selectors.links);
        // var placeholderContent = this.getPlaceholderContent();

        jQuery(replyForm).form({
            fields: {
                description: "empty",
            },
            onSuccess: function (e, fields) {
                e.preventDefault();

                var props = thisModule.getProps(replyForm, fields);
                props.comment_id = editProps.comment_id;
                props.methodType = editProps.methodType;
                // console.log(props);
                editProps.reviewContent.text(props.description);

                links.show();
                editProps.reviewContent.show();

                jQuery(this)
                    .closest("form.form")
                    .remove();

                jQuery
                    .post(scr_ajax.ajax_url, props, function (results) {
                        results = JSON.parse(results);
                        // console.log(results);

                        var editResult = jQuery("#" + results.comment_ID);
                        editResult.find(".text").text(results.comment_content);
                        editResult.transition("pulse");
                    })
                    .fail(function (response) {
                        console.log("review_reply failed");
                        console.log(response);
                    });
                // replyForm.replaceWith(placeholderContent);
                // thisModule.submit(replyForm, fields);
            },
        });
    },

    cancelBtn: function (reviewContent) {
        var links = jQuery(selectors.links);
        jQuery(selectors.replyForm + " .button.cancel").click(function (e) {
            e.preventDefault();
            links.show();

            if (reviewContent) {
                reviewContent.show();
            }

            jQuery(this)
                .closest(selectors.replyForm)
                .remove();
        });
    },

    submit: function (form, fields) {
        var props = this.getProps(form, fields);
        // console.log(props);

        jQuery
            .post(scr_ajax.ajax_url, props, function (results) {
                results = JSON.parse(results);
                // console.log(results);
                jQuery("#" + results.props.parent)
                    .find(".review_reply.placeholder")
                    .first()
                    .replaceWith(results.view);

                jQuery("#" + results.props.ID).transition("pulse");
            })
            .fail(function (response) {
                console.log("review_reply failed");
                console.log(response);
            });
    },

    getProps: function (submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("data-post-id");
        fields.parent = submittingForm.attr("data-comment-parent-id");

        return fields;
    },

    getPlaceholderContent: function () {
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
