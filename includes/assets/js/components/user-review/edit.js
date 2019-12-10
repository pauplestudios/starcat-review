var Stats = require("./stats.js");
var Form = require("./form.js");
// var ProsAndCons = require("./pros-and-cons.js");

var selectors = {
    link: ".scr_user_reviews .comment .actions .edit_link",
    links: ".scr_user_reviews .comment .actions",
    reviewForm: ".scr-user-review.form",
    replyForm: ".user-review-reply.form",
    submit: ".user-review-reply.form .submit",
};

var Edit = {
    init: function() {
        this.eventListener();
    },
    eventListener: function() {
        this.showForm();
    },
    showForm: function() {
        var thisModule = this;
        var links = jQuery(selectors.link);
        var formClone = this.getFormClone();

        links.click(function() {
            var link = jQuery(this);

            links.parent().show();
            link.parent().hide();
            jQuery(".comment .content .text").show();
            // console.log("some);

            var textContent = link
                .closest(".comment .content")
                .find(".text")
                .first();

            textContent.hide();
            textContent
                .next()
                .append(formClone)
                .next(selectors.reviewForm);

            thisModule.cancelBtn();
            // thisModule.formValidation();
            Form.init();
            // ProsAndCons.init();
            Stats.init();
        });
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
        jQuery(selectors.reviewForm + " button.cancel").click(function(e) {
            e.preventDefault();
            console.log("@@@ something wrong with you  @@@");
        });
    },

    getFormClone: function() {
        var form = jQuery(selectors.reviewForm);
        var clone = form.clone();
        clone.find("h2").remove();
        clone
            .addClass("tiny")
            .find(".submit.button")
            .addClass("tiny")
            .text("Save")
            .after('<button class="ui tiny cancel button">Cancel</button>');

        clone
            .wrap("<form class='mini'>")
            .css("display", "block")
            .parent()
            .html();

        form.remove();

        return clone;
    },
};

module.exports = Edit;
