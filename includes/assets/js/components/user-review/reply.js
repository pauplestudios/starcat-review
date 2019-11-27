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
            links.show();
            var link = jQuery(this);
            link.hide();
            jQuery(selectors.form).remove();

            link.parent()
                .parent()
                .parent()
                .append(formClone);

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
        var forms = jQuery(selectors.form);
        jQuery(forms).form({
            fields: {
                review_reply: "empty",
            },
            onSuccess: function(event, fields) {
                event.preventDefault();
                forms.remove();
                console.log(fields);
            },
        });
    },
};

module.exports = Reply;
