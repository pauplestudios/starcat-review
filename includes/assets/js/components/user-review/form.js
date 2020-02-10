formSubmitted = false;

var Form = {
    init: function() {
        this.eventListener();
        console.log("Submission JS Loaded !!!");
    },

    eventListener: function() {
        this.formValidation();
    },

    formValidation: function(fields) {
        var SCRForm = jQuery(".scr-user-review");
        var formFields = fields ? fields : Form.getRules();
        SCRForm.form({
            fields: formFields,
            onSuccess: function(event, fields) {
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;

                Form.submission(SCRForm, fields);
            },
        });
    },

    submission: function(SCRForm, fields) {
        var props = Form.getProps(SCRForm, fields);
        console.log("props: ");
        console.log(props);
        SCRForm.find(".submit.button").addClass("loading");
        // Ajax Post Submiting
        jQuery
            .post(scr_ajax.ajax_url, props, function(results) {
                results = JSON.parse(results);
                console.log("results scr_user_review_submission: ");
                console.log(results);

                // Success Message
                var msgProps = {
                    type: "positive",
                    title: "Thanks for your Review.",
                    description:
                        "You can see your review below. Also look at the user summary.",
                };
                SCRForm.html(Form.getMessageTemplate(msgProps));

                // Reviewed item prepending to Reviews List
                // jQuery("#scr-cat-collection").prepend(
                //     Form.getReviewTemplate(props.title, props.description)
                // );

                // Reloading the page
                setInterval("window.location.reload()", 6000);
            })
            .fail(function(response) {
                // Fail Message
                var msgProps = {
                    type: "negative",
                    title:
                        "This is a Bad request, Our development team processing it for while so we suggest you should Keep browsing!",
                    description: "Thanks for your Review though.",
                };
                SCRForm.html(Form.getMessageTemplate(msgProps));

                // Reloading the page
                setInterval("window.location.reload()", 6000);
            });
    },

    getProps: function(submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("post_id");

        return fields;
    },

    getRules: function() {
        var rules = {
            title: {
                identifier: "title",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please enter your title",
                    },
                ],
            },
            description: {
                identifier: "description",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please enter your description",
                    },
                ],
            },

            pros0: {
                identifier: "pros[0]",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please select or type a pro",
                    },
                ],
            },

            cons0: {
                identifier: "cons[0]",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please select or type a con",
                    },
                ],
            },

            captcha: {
                identifier: "captcha",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please select or type a con",
                    },
                ],
            },
        };

        rules = Form.ratingRules(rules);

        return rules;
    },

    ratingRules: function(rules) {
        if (SCROptions.global_stats) {
            jQuery(SCROptions.global_stats).each(function(index, item) {
                var identifier = "scores[" + item.stat_name.toLowerCase() + "]";
                rules[identifier] = {
                    identifier: identifier,
                    rules: [
                        {
                            type: "empty",
                            prompt: "Please rate " + item.stat_name,
                        },
                        {
                            type: "regExp[/^[1-9]+[0-9]*$/]",
                            prompt: "Please rate " + item.stat_name,
                        },
                    ],
                };
            });
        }
        return rules;
    },

    getMessageTemplate: function(props) {
        var message = '<div class="ui ' + props.type + ' message transition">';
        message += '<div class="header">';
        message += props.title;
        message += "</div>";
        message += "<p>" + props.description + "</p>";
        message += "</div>";

        return message;
    },

    getReviewTemplate: function(title, description) {
        var template =
            '<div class="scr-collection__col item col-xs-12 col-lg-12">';
        template += '< div class="scr-review-card" > ';
        template += '<div class="review-card__header">' + title + "</div>";
        template += '<div class="review-card__body">' + description + "</div>";
        template += "</div></div>";

        return template;
    },
};

module.exports = Form;
