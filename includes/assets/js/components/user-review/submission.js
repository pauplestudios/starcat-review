var Submission = {
    init: function() {
        this.eventListener();
        console.log("Submission JS Loaded !!!");
    },

    eventListener: function() {
        jQuery(".hrp-user-review-submission").submit(function(e) {
            e.preventDefault();

            const props = Submission.getProps(this);
            console.log("##### Props ######");
            console.log(props);

            jQuery.post(hrp_ajax.ajax_url, props, function(results) {
                results = JSON.parse(results);
                jQuery(".ui.search").search({
                    source: results
                });
            });
        });
    },

    getProps: function(submittedForm) {
        const props = {},
            pros = {},
            cons = {};
        const form = jQuery(submittedForm);

        props.action = form.attr("action");
        props.type = form.attr("method");

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
