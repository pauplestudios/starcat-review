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
            var reviewContent = link
                .closest(".comment .content")
                .find(".text")
                .first();

            // Hide clicked link of closest review content
            reviewContent.hide();

            reviewProps = thisModule.getEditProps(reviewContent);

            // var form = thisModule.getEditModifiedForm(reviewProps);
            var form = jQuery(selectors.userReviews);
            form.attr("data-comment-id", props.comment_id);

            // Append clonned edit form into closest review content of clicked edit link
            reviewContent.after(form).next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);

            Stats.init();
            // thisModule.editFormSubmit(reviewContent, reviewProps);

        });
    },

    getEditProps: function (content) {
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

    getEditModifiedForm: function (props) {
        var form = jQuery(selectors.reviewForm);

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
        }

        form.show();

        return form;
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

    editFormSubmit: function (reviewContent, reviewProps) {
        thisModule = this;
        var SCRForm = reviewContent.parent().find("form.form");
        console.log("editFormSubmit entry");
        reviewContent
            .parent()
            .find("form.form")
            .form({
                fields: Form.getRules(),
                onSuccess: function (event, fields) {
                    console.log("editFormSubmit success");
                    event.preventDefault();
                    if (editFormSubmitted) {
                        return;
                    }
                    editFormSubmitted = true;
                    reviewContent
                        .parent()
                        .find("form.form .submit.button")
                        .addClass("loading");
                    setTimeout(function () {
                        editFormSubmitted = false;
                    }, 10000);

                    var props = thisModule.getProps(SCRForm, fields);
                    props.pros = reviewProps.pros;
                    props.cons = reviewProps.cons;
                    // console.log(props);
                    jQuery
                        .post(scr_ajax.ajax_url, props, function (results) {
                            results = JSON.parse(results);
                            console.log("@@@@ Edit Form Results @@@");
                            console.log(results);

                            // Reloading the page
                            setInterval("window.location.reload()", 6000);
                        })
                        .fail(function (response) {
                            // Fail Message
                            console.log("editFormSubmit fail");
                            console.log(response);
                            SCRForm.html("Failed Updated");

                            // Reloading the page
                            setInterval("window.location.reload()", 6000);
                        });
                },
            });
    },

    getProps: function (submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("post_id");
        fields.comment_id = submittingForm.attr("data-comment-id");
        fields.captcha = submittingForm.find("#captcha").attr("value");
        fields.methodType = submittingForm.attr("data-method");

        return fields;
    },

};

module.exports = Edit;
