var Stats = require("./stats.js");
var Form = require("./form.js");
var ProsAndCons = require("./pros-and-cons.js");
var editFormSubmitted = false;
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
            reviewContent.after(form).next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);

            Stats.init();
            thisModule.editFormSubmit(reviewContent, reviewProps);
            // Form.formValidation("", reviewContent.closest("form.form"));
            // thisModule.get_ProsandCons(
            //     ".review-pros-repeater",
            //     "pros",
            //     reviewContent,
            //     editForm
            // );
            // thisModule.get_ProsandCons(
            //     ".review-cons-repeater",
            //     "cons",
            //     reviewContent,
            //     editForm
            // );
        });
    },

    editFormSubmit: function(reviewContent, reviewProps) {
        thisModule = this;
        var SCRForm = reviewContent.parent().find("form.form");

        reviewContent
            .parent()
            .find("form.form")
            .form({
                fields: Form.getRules(),
                onSuccess: function(event, fields) {
                    event.preventDefault();
                    if (editFormSubmitted) {
                        return;
                    }
                    editFormSubmitted = true;
                    reviewContent
                        .parent()
                        .find("form.form .submit.button")
                        .addClass("loading");
                    setTimeout(function() {
                        editFormSubmitted = false;
                    }, 10000);

                    var props = thisModule.getProps(SCRForm, fields);
                    props.pros = reviewProps.pros;
                    props.cons = reviewProps.cons;
                    // console.log(props);
                    jQuery
                        .post(scr_ajax.ajax_url, props, function(results) {
                            results = JSON.parse(results);
                            console.log(results);

                            //         // Reviewed item prepending to Reviews List
                            //         // jQuery("#scr-cat-collection").prepend(
                            //         //     Form.getReviewTemplate(props.title, props.description)
                            //         // );

                            //         // Reloading the page
                            setInterval("window.location.reload()", 6000);
                        })
                        .fail(function(response) {
                            // Fail Message

                            SCRForm.html("Failed Updated");

                            // Reloading the page
                            setInterval("window.location.reload()", 6000);
                        });
                },
            });
    },

    getProps: function(submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("post_id");
        fields.comment_id = submittingForm.attr("data-comment-id");
        fields.methodType = submittingForm.attr("data-method");

        return fields;
    },

    getElement: function(element, props) {
        var thisModule = this;
        var form = jQuery(element);
        form.attr("data-comment-id", props.comment_id);
        form.attr("data-method", props.methodType);

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

    get_ProsandCons: function(selector, group, reviewContent, form) {
        var list = jQuery(reviewContent)
            .parent()
            .find("form.form")
            .find("[data-repeater-list=" + group + "]");

        var duplicateItem = jQuery(form)
            .find("[data-repeater-list=" + group + "] [data-repeater-item]")
            .first()
            .parent()
            .html();

        ProsAndCons.addItem(selector, list, group, duplicateItem);
        ProsAndCons.deleteItem(selector, list, group);

        // Already loaded element Pros and Cons Dropdown
        jQuery(selector + " .ui.prosandcons.dropdown").dropdownX({
            allowAdditions: true,
        });
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

        var pros = [];
        var prosArray = item.find(".pros li");
        for (i = 0; i < prosArray.length; i++) {
            pros[i] = jQuery(prosArray[i])
                .text()
                .toLowerCase();
        }

        var cons = [];
        var consArray = item.find(".cons li");
        for (i = 0; i < consArray.length; i++) {
            cons[i] = jQuery(consArray[i])
                .text()
                .toLowerCase();
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
            pros: pros,
            cons: cons,
            comment_id: item.attr("id"),
            comment_parent: 0,
            methodType: "PUT",
        };

        // console.log(props);
        return props;
    },

    cancelBtn: function(reviewContent) {
        var links = jQuery(selectors.links);
        jQuery(selectors.reviewForm + " .button.cancel").click(function(e) {
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
            .after('<div class="ui cancel mini button">Cancel</div>')
            .after('<div class="ui blue submit mini button">Save</div>')
            .remove();

        form.addClass("mini");
        form.find(".rating.fields")
            .siblings(".two.fields")
            .remove();

        return form;
    },
};

module.exports = Edit;
