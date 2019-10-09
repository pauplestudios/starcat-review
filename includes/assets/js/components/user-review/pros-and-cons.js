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

        ProsAndCons.addItem(selector, list, group);
        ProsAndCons.deleteItem(selector, list, group);

        // Already loaded element Pros and Cons Dropdown
        jQuery(selector + " .ui.dropdown").dropdown({
            allowAdditions: true
        });
    },

    addItem: function(selector, list, group) {
        const duplicateItem = list
            .find("[data-repeater-item]")
            .first()
            .parent()
            .html();

        jQuery(selector + " [data-repeater-create]").on("click", function() {
            let indexedItem = ProsAndCons.setIndex(list, duplicateItem, group);

            list.append(indexedItem);
            ProsAndCons.deleteItem(selector, list, group);
            ProsAndCons.reinitiateEvents(list, group);

            // Pros and Cons Dropdown Items
            jQuery(selector + " .ui.dropdown").dropdown({
                allowAdditions: true
            });
        });
    },

    deleteItem: function(selector, list, group) {
        jQuery(selector + " [data-repeater-item] [data-repeater-delete]").on(
            "click",
            function() {
                jQuery(this)
                    .parent()
                    .parent()
                    .remove();
                ProsAndCons.updateIndex(list, group);
                ProsAndCons.reinitiateEvents(list, group);
            }
        );
    },

    reinitiateEvents: function(list, group) {
        ProsAndCons.setRules(list, group);
        Form.formValidation(formFields);
    },

    setIndex: function(list, item, dataAttr) {
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

    updateIndex: function(list, group) {
        let items = list.find("[data-repeater-item]");

        let count = 0;
        items.each(function(index, item) {
            jQuery(item)
                .find("[data-" + group + "]")
                .attr("name", group + "[" + count + "]");
            count++;
        });
    },

    setRules: function(list, group) {
        let items = list.find("[data-repeater-item]");
        items.each(function(index, item) {
            let field = jQuery(item)
                .find("[data-" + group + "]")
                .attr("name");
            formFields[field] = ProsAndCons.updateRules(field, group);
        });
    },

    updateRules: function(identifier, group) {
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
