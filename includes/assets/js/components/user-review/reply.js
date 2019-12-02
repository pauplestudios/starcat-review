var selectors = {
    link: ".scr_user_reviews .comment .actions .reply_link",
    form: ".user-review-reply.form",
    submit: ".user-review-reply.form .submit",
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
        var links = jQuery(selectors.link);
        var formClone = this.getFormClone();

        links.click(function() {
            var link = jQuery(this);
            var author = link
                .closest(".content")
                .find(".author")
                .first()
                .text()
                .trim();

            var parent = link.closest(".comment").attr("id");
            // console.log(link.closest(".comment").find.children().length);
            var placeholder = "Reply to @" + author + " ...";

            links.show();
            link.hide();
            jQuery(selectors.form).remove();

            /*  Append review reply form to comment content
                set a placeholder and a data-comement-parent-id attributes  */
            link.closest(".comment .content .actions")
                .after(formClone)
                .next(selectors.form)
                .attr("data-comment-parent-id", parent)
                .find('[name="description"]')
                .attr("placeholder", placeholder);

            thisModule.formValidation();
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
