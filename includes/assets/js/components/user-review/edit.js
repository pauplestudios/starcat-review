var Stats = require("./stats.js");
var Form = require("./form.js");
var ProsAndCons = require("./pros-and-cons.js");

var selectors = {
    reviewForm: ".scr-user-review.form",
    replyForm: ".user-review-reply.form",
    userReviews: ".scr_user_reviews.comments",
    submit: ".user-review-reply.form .submit",
    links: ".scr_user_reviews .comment .actions",
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

        editlinks.click(function() {
            var link = jQuery(this);

            // Show all reviews list links
            links.show();

            // Remove all reviews list forms except clonned form
            jQuery(selectors.userReviews)
                .find("form.form")
                .remove();

            // Hide clicked review link
            link.parent()
                .parent()
                .hide();
            jQuery(".comment .content .text").show();

            // Clicked link closest review content
            var reviewContent = link
                .closest(".comment .content")
                .find(".text")
                .first();

            // Hide clicked link of closest review content
            reviewContent.hide();

            reviewProps = thisModule.getEditProps(reviewContent);

            var form = thisModule.getElement(editForm, reviewProps);

            // Append clonned edit form into closest review content of clicked edit link
            reviewContent
                .parent()
                .append(form)
                .next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);
            // thisModule.formValidation();
            Stats.init();
            ProsAndCons.init();
            Form.init();
        });
    },

    getElement: function(element, props) {
        var form = jQuery(element);

        form.find("[name='title']").attr("value", props.title);
        form.find("[name='description']").text(props.description);

        for (var i = 0; i < props.stats.length; i++) {
            form.find("[name='" + props.stats[i].identifier + "']")
                .siblings(".stars-result")
                .css({
                    width: props.stats[i].value + "%",
                });

            form.find("[name='" + props.stats[i].identifier + "']").attr(
                "value",
                props.stats[i].value
            );

            form.find("[name='" + props.stats[i].identifier + "']")
                .parent()
                .siblings(".review-item-label__score")
                .text(props.stats[i].score);
            // console.log(some);
        }
        element = form[0].outerHTML;

        // console.log(form);

        return element;
    },

    getEditProps: function(content) {
        var item = jQuery(content).closest(".comment");
        var stats = [];
        var items = item.find(".stats input");
        var jj = 0;
        for (var i = 0; i < items.length; i++) {
            var stat = jQuery(items[i]);
            var name = stat.attr("name");
            var value = stat.attr("value");
            var score = stat
                .parent()
                .siblings(".reviewed-item-label__score")
                .text();
            if (name !== "scores[overall]") {
                stats[jj] = {
                    identifier: name,
                    value: value,
                    score: score,
                };
                jj++;
            }
        }

        var props = {
            title: item
                .find(".title")
                .text()
                .trim(),
            description: item
                .find(".description")
                .text()
                .trim(),
            stats: stats,
            pros: item.find(".pros li"),
            cons: item.find(".cons li"),
            comment_id: item.attr("id"),
            comment_parent: 0,
            methodType: "update",
        };

        console.log(props);
        return props;
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

    cancelBtn: function(reviewContent) {
        var links = jQuery(selectors.links);
        jQuery(selectors.reviewForm + " button.cancel").click(function(e) {
            e.preventDefault();

            links.show();
            reviewContent.show();

            jQuery(this)
                .closest("form.form")
                .remove();

            // var content = cancelButton;
            // console.log("@@@ content @@@");
            // console.log(content);

            // .find(".text")
            // .show();

            // console.log("@@@ something wrong with you  @@@");
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
