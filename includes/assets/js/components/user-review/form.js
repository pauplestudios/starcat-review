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
        const HRPForm = jQuery(".hrp-user-review");
        let formFields = fields ? fields : Form.getRules();
        HRPForm.form({
            fields: formFields,
            onSuccess: function(event, fields) {
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;

                Form.submission(HRPForm, fields);
            }
        });
    },

    submission: function(HRPForm, fields) {
        const props = Form.getProps(HRPForm, fields);
        console.log(props);
        // Ajax Post Submiting
        jQuery
            .post(hrp_ajax.ajax_url, props, function(results) {
                results = JSON.parse(results);
                console.log(results);

                // Success Message
                let msgProps = {
                    type: "positive",
                    title: "Thanks for your Review.",
                    description:
                        "You can see your review below. Also look at the user summary."
                };
                HRPForm.html(Form.getMessageTemplate(msgProps));

                // Reviewed item prepending to Reviews List
                jQuery("#hrp-cat-collection").prepend(
                    Form.getReviewTemplate(props.title, props.description)
                );

                // Reloading the page
                setInterval("window.location.reload()", 6000);
            })
            .fail(function(response) {
                // Fail Message
                let msgProps = {
                    type: "negative",
                    title:
                        "This is a Bad request, Our development team processing it for while so we suggest you should Keep browsing!",
                    description: "Thanks for your Review though."
                };
                HRPForm.html(Form.getMessageTemplate(msgProps));

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
        return {
            title: {
                identifier: "title",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please enter your title"
                    }
                ]
            },
            description: {
                identifier: "description",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please enter your description"
                    }
                ]
            },

            pros0: {
                identifier: "pros[0]",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please select or type a pro"
                    }
                ]
            },

            cons0: {
                identifier: "cons[0]",
                rules: [
                    {
                        type: "empty",
                        prompt: "Please select or type a con"
                    }
                ]
            }
        };
    },

    getMessageTemplate: function(props) {
        const message = `<div class="ui ${props.type} message transition">        
        <div class="header">
          ${props.title}
        </div>
        <p>${props.description}</p>
      </div>`;

        return message;
    },

    getReviewTemplate: function(title, description) {
        return `<div class="hrp-collection__col item col-xs-12 col-lg-12"> <div class="hrp-review-card">
        <div class="review-card__header">${title}</div>        
        <div class="review-card__body">${description}</div>
        <span class="reviewCount" data-reviewcount="75"></span></div></div>`;
    }
};

module.exports = Form;
