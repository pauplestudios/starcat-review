require("jquery.repeater");
var Form = require("./form.js");
var formFields = Form.get_fields();
var formSubmitted = false;

var ProsAndCons = {
    init: function() {
        this.eventListener();
    },

    eventListener: function() {
        this.getRepeater(".review-pros-repeater", "pros");
        this.getRepeater(".review-cons-repeater", "cons");
    },

    getRepeater: function(selector, group) {
        jQuery(selector).repeater({
            show: function() {
                const item = jQuery(this);
                item.fadeIn();

                let field = item.find("[data-cons]").attr("name");
                ProsAndCons.addFieldToValidate(field, group);
                ProsAndCons.reiniateEvents(selector);
            },
            hide: function(deleteElement) {
                jQuery(this).fadeOut(deleteElement);
            }
            // isFirstItemUndeletable: true,
        });
        ProsAndCons.reiniateEvents(selector);
    },

    addFieldToValidate: function(field, group) {
        var key = field.match(/\[(\d+)\]/)[1];
        let set1 = group + key;
        let identifier1 = group + "[" + key + "][]";

        let set11 = group + key + key;
        let identifier11 = group + "[" + key + "][" + key + "]";

        formFields[set1] = ProsAndCons.generateField(identifier1, group);
        formFields[set11] = ProsAndCons.generateField(identifier11, group);
    },

    generateField: function(identifier, group) {
        return {
            identifier: identifier,
            rules: [
                {
                    type: "empty",
                    prompt: "Please select or type a " + group
                }
            ]
        };
    },

    reiniateEvents: function(selector) {
        const hrpForm = jQuery(".hrp-user-review");

        hrpForm.form({
            fields: formFields,
            onSuccess: function(event, fields) {
                event.preventDefault();
                if (formSubmitted) {
                    return;
                }
                formSubmitted = true;
                console.log("!!!!! Pros and Cons Master !!!!!");
                console.log(fields);
                hrpForm.html(Form.getSuccessMessage());
            }
        });

        jQuery(selector + " .ui.dropdown").dropdown({
            allowAdditions: true
        });
    }
};

module.exports = ProsAndCons;
