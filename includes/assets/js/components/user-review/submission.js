var Submission = {
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
        jQuery(".hrp-user-review").form({
            fields: {
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
                pros: {
                    identifier: "pros[]",
                    rules: [
                        {
                            type: "empty",
                            prompt: "Please select or type a pro"
                        }
                    ]
                },
                cons: {
                    identifier: "cons[]",
                    rules: [
                        {
                            type: "empty",
                            prompt: "Please select or type a con"
                        }
                    ]
                }
            }
        });
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

module.exports = Submission;
