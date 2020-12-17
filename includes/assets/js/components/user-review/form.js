formSubmitted = false;

var Form = {
    init: function () {
        this.eventListener();
        
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
        SCRForm.form({
            fields: formFields,
            onSuccess: function (event, fields) {
                var imageValidation = Form.imageValidation(SCRForm);
                if(imageValidation.status == 2){
                    alert(imageValidation.message);
                    return false;
                }
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;
                Form.submission(SCRForm, fields);
            },
        });
    },

    submission: function (SCRForm, fields) {
        var form_data = Form.getProps(SCRForm, fields);
        SCRForm.find(".submit.button").addClass("loading");
        // Ajax Post Submiting        
        jQuery.ajax({
            type: "post",
            url: scr_ajax.ajax_url,
            cache: false,
            data: form_data,
            processData: false, // Preventing default data parse behavior                        
            contentType: false,
            success: function (results) {

                // Photo Reviews json response 
                if(results.addon === 'SCR_PR'){
                    if(results.status == 2){
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
            }
        }).fail(function (response) {
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
        var uploadField = document.getElementById('scr_pr_image_upload');
        var files = (uploadField) ? uploadField.files : [];

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
                        type: 'email',
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

    ratingRules: function (rules) {
        if (SCROptions.global_stats) {
            jQuery(SCROptions.global_stats).each(function (index, item) {
                // var identifier = "scores[" + item.stat_name.toLowerCase() + "]";
                var identifier = "scr-stat-rating-"+index;
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
    imageValidation: function (SCRForm){
        var filesCount = 0;
        var files = [];
        if(SCROptions.required_options.pr_require_photo == 1){
            var uploadField = document.getElementById('scr_pr_image_upload');
            files = (uploadField) ? uploadField.files : [];
            var uploadedImageGroup = SCRForm.find('.field .images.scr_pr_uploaded_image_group');
            var uploadedImages = uploadedImageGroup.find('.deleteable.image').length;
           
            if(files.length == 0 && uploadedImages == 0){
                return {
                    status: 2,
                    res_type: 'PHOTO_REQUIRED',
                    message: 'Photo is Required'
                };
            }
            filesCount = files.length;
        }
       
        // Checking Files Quantities
        if(filesCount > SCROptions.required_options.pr_photo_quantity){
            return {
                status: 2,
                res_type: 'MAX_LIMIT_EXISTS',
                message: 'Maximum number of files allowed is '+SCROptions.required_options.pr_photo_quantity
            };
        }

        // photo max file size checking
        var maxPhotoSize =  SCROptions.required_options.pr_photo_size;
        for(ii = 0; ii < filesCount; ii++){
            var size = files[ii].size;
            var fileSize = Math.round((size / 1024));    
            if(fileSize > maxPhotoSize){
                return {
                    status: 2,
                    res_type: 'MAX_LIMIT_EXISTS',
                    message: 'Max size allowed: '+maxPhotoSize+'kB'
                };
            }
        }


        return {
            status: 1,
            res_type: 'SUCCESS'
        };
    }
};

module.exports = Form;
