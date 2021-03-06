formSubmitted = false;

var Form = {
    init: function () {
        this.eventListener();
        console.log("formSubmitted" + formSubmitted);
        console.log("Submission JS Loaded !!!");
    },

    eventListener: function () {
        this.formValidation();
        this.reCaptcha();
    },

    reCaptcha: function () {
        console.log("recAptcha () ");
        jQuery("form.scr-user-review").removeClass("active");
        jQuery("form.scr-user-review:visible").addClass("active");
        jQuery(".edit_link").click(function () {
            setTimeout(function () {
                jQuery("form.scr-user-review").removeClass("active");
                jQuery("form.scr-user-review:visible").addClass("active");
            }, 1000);
        });
    },

    formValidation: function (fields) {
        var SCRForm = jQuery(".scr-user-review");
        var formFields = fields ? fields : Form.getRules();
        // console.log("*** formFields ***");
        // console.log(formFields);
        SCRForm.formX({
            fields: formFields,
            inline: true,
            on: "blur",
            onSuccess: function (event, fields) {
                // get current review Form
                var reviewForm = jQuery(event.target);
                var imageValidation = Form.imageValidation(reviewForm);
                if (imageValidation.status === "failed") {
                    alert(imageValidation.message);
                    return false;
                }
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;
                Form.submission(reviewForm, fields);
            },
            errors: {
                method: "The method you called is not defined.",
            },
            // onFailure: function (formErrors, fields) {
            //     console.log("On Failure");
            //     console.log(formErrors);
            //     console.log(fields);
            // },
        });
    },

    submission: function (SCRForm, fields) {
        var form_data = Form.getProps(SCRForm, fields);
        // return false;
        SCRForm.find(".submit.button").addClass("loading");
        // Ajax Post Submiting
        jQuery
            .ajax({
                type: "post",
                url: scr_ajax.ajax_url,
                cache: false,
                data: form_data,
                processData: false, // Preventing default data parse behavior
                contentType: false,
                success: function (results) {
                    // Photo Reviews json response
                    if (results.addon === "SCR_PR") {
                        if (results.status === "failed") {
                            alert(results.message);
                            // Reloading the page
                            window.location.reload();
                            return false;
                        }
                    }
                    results = JSON.parse(results);

                    // Success Message
                    var msgProps = {
                        type: "positive",
                        title: Translations.reviewSuccessTitle,
                        description: Translations.reviewSuccessDescription,
                    };

                    SCRForm.html(Form.getMessageTemplate(msgProps));

                    // Reviewed item prepending to Reviews List
                    // jQuery("#scr-cat-collection").prepend(
                    //     Form.getReviewTemplate(props.title, props.description)
                    // );

                    // Reloading the page
                    setInterval("window.location.reload()", 5000);
                },
            })
            .fail(function (response) {
                console.log("!!! Submision Failed !!!");
                console.log(response);
                // Fail Message
                var msgProps = {
                    type: "negative",
                    title: Translations.reviewFailTitle,
                    description: Translations.reviewFailDescription,
                };
                SCRForm.html(Form.getMessageTemplate(msgProps));

                // Reloading the page
                setInterval("window.location.reload()", 5000);
            }, JSON);
    },

    getProps: function (submittingForm, fields) {
        fields.action = submittingForm.attr("action");
        fields.type = submittingForm.attr("method");
        fields.post_id = submittingForm.attr("post_id");
        fields.comment_id = submittingForm.attr("data-comment-id");
        fields.methodType = submittingForm.attr("data-method");

        var form_data = new FormData();
        var uploadField = document.getElementById("scr_pr_image_upload");
        var files = uploadField ? uploadField.files : [];

        console.log("Files Length : ");
        console.log(files.length);

        // Appending Uploaded Image form Datas
        for (var x = 0; x < files.length; x++) {
            form_data.append("files[]", files[x]);
        }

        // Appending Semantic Validated fields into form Data
        for (var key in fields) {
            form_data.append(key, fields[key]);
        }

        return form_data;
    },

    getRules: function () {
        var rules = {
            name: {
                identifier: "name",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please enter your Name",
                    },
                ],
            },
            email: {
                identifier: "email",
                rules: [
                    {
                        type: "email",
                        prompt: "Please enter your E-mail",
                    },
                ],
            },
            // website: {
            //     identifier: "website",
            //     rules: [
            //         {
            //             type: "empty",
            //             prompt: "Please enter your Website URL",
            //         },
            //     ],
            // },
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

            src_recaptcha: {
                identifier: "src_recaptcha",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please verify the reCaptcha",
                    },
                ],
            },
        };

        rules = Form.ratingRules(rules);

        return rules;
    },

    ratingRules: function (rules) {
        if (SCROptions.global_stats) {
            jQuery(SCROptions.global_stats).each(function (index, item) {
                // var identifier = "scores[" + item.stat_name.toLowerCase() + "]";
                var identifier = "scr-stat-rating-" + index;
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

    getMessageTemplate: function (props) {
        var message = '<div class="ui ' + props.type + ' message transition">';
        message += '<div class="header">';
        message += props.title;
        message += "</div>";
        message += "<p>" + props.description + "</p>";
        message += "</div>";

        return message;
    },

    getReviewTemplate: function (title, description) {
        var template =
            '<div class="scr-collection__col item col-xs-12 col-lg-12">';
        template += '< div class="scr-review-card" > ';
        template += '<div class="review-card__header">' + title + "</div>";
        template += '<div class="review-card__body">' + description + "</div>";
        template += "</div></div>";

        return template;
    },
    imageValidation: function (SCRForm) {
        /**
         * check if photo review is active or not.
         * If activate then only validate the attachement, based on settings.else no need to validate.
         *
         * */
        if (
            !SCROptions.addons.pr ||
            SCROptions.required_options.pr_enable == 0
        ) {
            return true;
        }

        var filesCount = 0;
        var files = [];
        var uploadField = document.getElementById("scr_pr_image_upload");
        files = uploadField ? uploadField.files : [];
        filesCount = files.length;

        var uploadedImageGroup = SCRForm.find(
            ".field .images.scr_pr_uploaded_image_group"
        );
        var uploadedImages = uploadedImageGroup.find(".deleteable.image")
            .length;

        filesCount = parseInt(uploadedImages) + parseInt(filesCount);

        if (SCROptions.required_options.pr_require_photo == 1) {
            if (filesCount == 0 && uploadedImages == 0) {
                return {
                    status: "failed",
                    message: "Photo is Required",
                };
            }
        }

        // Checking Files Quantities
        if (filesCount > SCROptions.required_options.pr_photo_quantity) {
            return {
                status: "failed",
                message:
                    "Maximum number of files allowed is " +
                    SCROptions.required_options.pr_photo_quantity,
            };
        }

        var allowedFileFormats = [
            "image/jpg",
            "image/jpeg",
            "image/bmp",
            "image/png",
            "image/gif",
        ];

        // photo max file size checking
        var maxPhotoSize = SCROptions.required_options.pr_photo_size;
        for (ii = 0; ii < files.length; ii++) {
            var size = files[ii].size;
            var fileSize = Math.round(size / 1024);
            var fileType = files[ii].type;
            if (fileSize > maxPhotoSize) {
                return {
                    status: "failed",
                    message: "Max size allowed: " + maxPhotoSize + "kB",
                };
            }

            if (allowedFileFormats.indexOf(fileType) == -1) {
                return {
                    status: "failed",
                    message: "Only JPG, JPEG, BMP, PNG and GIF are allowed",
                };
            }
        }

        return {
            status: "success",
            message: "Pass the attachment validations",
        };
    },
};

module.exports = Form;
