formSubmitted = false;
var Form = {
    init: function() {
        this.eventListener();
        console.log("Submission JS Loaded !!!");
    },

    eventListener: function() {
        // jQuery(".hrp-user-review").submit(function(e) {
        //     e.preventDefault();
        //     const props = Submission.getProps(this);
        //     console.log("##### Props ######");
        //     console.log(props);
        // jQuery.post(hrp_ajax.ajax_url, props, function(results) {
        //     results = JSON.parse(results);
        //     console.log(results);
        // });
        // });

        this.formValidation();
    },

    formValidation: function(fields) {
        console.log("Times");

        let formFields = fields ? fields : Form.get_fields();
        jQuery(".hrp-user-review").form({
            fields: formFields,
            onSuccess: function(event, fields) {
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;
                console.log(fields);
                // hrpForm.html(Form.getSuccessMessage());
                jQuery("#hrp-cat-collection").prepend(
                    Form.reviewItemTemplate(fields.title, fields.description)
                );
            }
        });
        // console.log(Times);
    },

    getSuccessMessage: function() {
        const message = `<div class="ui positive message transition">        
        <div class="header">
          Thanks for your Review.
        </div>
        <p>You can see your review below. Also look at the user summary. </p>
      </div>`;

        return message;
    },

    reviewItemTemplate: function(title, description) {
        return `<div class="hrp-collection__col item col-xs-12 col-lg-12"> <div class="hrp-review-card">
        <div class="review-card__header">${title}</div>        
        <div class="review-card__body">${description}</div>
        <span class="reviewCount" data-reviewcount="75"></span></div></div>`;
    },

    get_fields: function() {
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

    getProps: function(submittedForm) {
        const props = {},
            pros = {},
            cons = {};
        const form = jQuery(submittedForm);

        props.action = form.attr("action");
        props.type = form.attr("method");
        props.post_id = form.attr("post_id");

        form.find("[name]").each(function(i, v) {
            var input = jQuery(this),
                name = input.attr("name"),
                value = input.val();
            props[name] = value;
        });

        // Pros
        form.find("[data-pros]").each(function(i) {
            var input = jQuery(this),
                value = input.val();
            pros[i] = value;
        });
        props.pros = pros;

        // Cons
        form.find("[data-cons]").each(function(i) {
            var input = jQuery(this),
                value = input.val();
            cons[i] = value;
        });
        props.cons = cons;

        return props;
    }
};

module.exports = Form;
