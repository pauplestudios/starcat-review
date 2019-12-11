var Stats = require("./stats.js");
var Form = require("./form.js");
var ProsAndCons = require("./pros-and-cons.js");

var selectors = {
    reviewForm: ".scr-user-review.form",
    replyForm: ".user-review-reply.form",
    submit: ".user-review-reply.form .submit",
    links: ".scr_user_reviews .comment .actions .links",
    editLink: ".scr_user_reviews .comment .actions .edit_link",
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
        var editlinks = jQuery(selectors.editLink);
        var links = jQuery(selectors.links);
        var editForm = this.getEditForm();
        // var duplicateItem = this.interpreateClonnedForm(formClone);

        editlinks.click(function() {
            var link = jQuery(this);

            links.show();
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
                .append(editForm)
                .next(selectors.reviewForm);

            thisModule.cancelBtn();
            // thisModule.formValidation();
            Stats.init();
            ProsAndCons.init();
            Form.init();
        });
    },

    interpreateClonnedForm: function(item) {
        var interpretedItem = jQuery(item);
        console.log(interpretedItem);
        return interpretedItem.html();
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
        jQuery(selectors.reviewForm + " button.cancel").click(function(e) {
            e.preventDefault();

            links.show();
            var cancelButton = jQuery(this);

            cancelButton.closest("form.form").remove();

            cancelButton
                .closest(".comment .content")
                .find(".text")
                .show();

            console.log("@@@ something wrong with you  @@@");
        });
    },

    getEditForm: function() {
        var form = jQuery(selectors.reviewForm);
        var duplicateForm = form.clone();
        var editForm = this.modifyForm(duplicateForm);
        var editFormHtml = editForm
            .clone()
            .wrap("<form class='" + selectors.reviewForm + "''>")
            .css("display", "block")
            .parent()
            .html();

        // form.remove();

        return editFormHtml;
    },

    modifyForm: function(form) {
        form.find("h2").remove();
        form.find("h5").addClass("ui tiny header");
        form.find(".button").addClass("mini");
        form.find(".dropdown").addClass("mini");
        form.find(".submit.button")
            .text("Save")
            .after('<button class="ui cancel mini button">Cancel</button>');

        form.addClass("mini");
        // form.find("h2").remove();

        return form;
    },
};

module.exports = Edit;
