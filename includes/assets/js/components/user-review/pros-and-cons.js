var Form = require("./form.js");
var formFields = Form.get_fields();
var ProsAndCons = {
    init: function() {
        this.eventListener();
    },

    eventListener: function() {
        this.getRepeater(".review-pros-repeater", "pros");
        this.getRepeater(".review-cons-repeater", "cons");
    },

    getRepeater: function(selector, group) {
        var list = jQuery(selector).find("[data-repeater-list=" + group + "]");

        const duplicateItem = list
            .find("[data-repeater-item]")
            .first()
            .parent()
            .html();

        jQuery(selector + " [data-repeater-create]").on("click", function() {
            let indexedItem = ProsAndCons.setIndexToField(
                list,
                duplicateItem,
                group
            );

            list.append(indexedItem);
            ProsAndCons.reiniateEvents(selector, list, group);
        });

        ProsAndCons.reiniateEvents(selector, list, group);
    },

    setIndexToField: function(list, item, dataAttr) {
        let key = list.children().length;

        let field = jQuery(item);

        let indexedField = field
            .find("[data-" + dataAttr + "]")
            .attr("name", dataAttr + "[" + key + "]")
            .parent()
            .parent()
            .html();

        let fieldHtml = field.html(indexedField);
        let indexedHtml = fieldHtml
            .wrapAll("<div>")
            .parent()
            .html();

        return indexedHtml;
    },

    reiniateEvents: function(selector, list, group) {
        ProsAndCons.getItemDelete(
            selector + " [data-repeater-item] [data-repeater-delete]",
            list,
            group
        );

        ProsAndCons.updateValidateRules(list, group);
        Form.formValidation(formFields);
        jQuery(selector + " .ui.dropdown").dropdown({
            allowAdditions: true
        });
    },

    getItemDelete: function(selector, list, group) {
        jQuery(selector).on("click", function() {
            jQuery(this)
                .parent()
                .parent()
                .remove();
            ProsAndCons.updateFieldsIndex(list, group);
            ProsAndCons.updateValidateRules(list, group);
            ProsAndCons.reiniateEvents(selector, list, group);
        });
    },

    updateValidateRules: function(list, group) {
        let items = list.find("[data-repeater-item]");
        let count = 0;
        items.each(function(index, item) {
            let field = jQuery(item)
                .find("[data-" + group + "]")
                .attr("name");

            formFields[field] = ProsAndCons.generateField(field, group);
            count++;
        });
    },

    updateFieldsIndex: function(list, group) {
        let items = list.find("[data-repeater-item]");

        let count = 0;
        items.each(function(index, item) {
            jQuery(item)
                .find("[data-" + group + "]")
                .attr("name", group + "[" + count + "]");
            count++;
        });
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
    }
};

module.exports = ProsAndCons;
