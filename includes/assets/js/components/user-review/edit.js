var Stats = require("./stats.js");

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

            // Forms attributes and show the form

            var form = jQuery(selectors.reviewForm);
            // var commentID = reviewContent.closest(".comment").attr("id");
            var commentProps = reviewContent.closest(".comment").data("props");
            // console.log("title" + reviewContent.text().trim());
            form.attr("data-comment-id", reviewContent.closest(".comment").attr("id"));
            form = Edit.modify_form_for_editing(form, commentProps, reviewContent);
            // form.show();

            // Append clonned edit form into closest review content of clicked edit link
            reviewContent.after(form).next(selectors.reviewForm);

            thisModule.cancelBtn(reviewContent);

            Stats.init();
            // thisModule.editFormSubmit(reviewContent, reviewProps);

        });
    },

    modify_form_for_editing: function (form, props, content) {
        // console.log('@@@ Comment Form @@@');
        // console.log(form);
        form.addClass('mini');
        form.find('h2.ui.header').remove();
        // console.log('@@@ comment ID @@@');
        // console.log(commentID);
        console.log('@@@ Comment Data Props @@@');
        console.log(props);
        // console.log('@@@ Comment Edit Form @@@');
        // console.log(form);
        props.title = content.find('.title').text().trim();
        props.description = content.find('.description').text().trim();
        console.log('@@@ Comment Data Props @@@');
        console.log(props);
        var sumbitBtn = '<div class="ui blue submit mini button">Save</div>';
        var cancelBtn = '<div class="ui cancel mini button">Cancel</div>';
        form.find("h5").addClass("ui tiny header");
        form.find('[name="title"]').val(props.title);
        form.find('[name="description"]').val(props.description);
        form.find(".submit.button").closest('.field').html(sumbitBtn + cancelBtn);
        form.show();

        // Stats Items and Values
        form.find('.review-list li').each(function () {
            var item = jQuery(this);
            var stat = props.stats[item.find('.review-item-label__text').text().trim()];
            if (!stat) {
                console.log('@@@ Remove Stat Item @@@');
                item.remove();
            }
            jQuery(this).find('.stars-result').css('width', stat + '%');
            // console.log('@@@ Item @@@');

        });
        // for (var i = 0; i < list.children().length; i++) {
        //     form.find('.review-list li').child;
        // }
        // console.log('@@@ List stat item @@@');
        // console.log(item);

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
};

module.exports = Edit;
