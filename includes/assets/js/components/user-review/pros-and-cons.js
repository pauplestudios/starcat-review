var Form = require("./form.js");
var formRules = Form.getRules();
var ProsAndCons = {
    init: function () {
        this.eventListener();
    },

    eventListener: function () {
        this.getRepeater(".review-pros-repeater", "pros");
        this.getRepeater(".review-cons-repeater", "cons");
    },

    getRepeater: function (selector, group) {
        var list = jQuery(selector).find("[data-repeater-list=" + group + "]");

        ProsAndCons.addItem(selector, list, group);
        ProsAndCons.deleteItem(selector, list, group);

        // Already loaded element Pros and Cons Dropdown
        jQuery(selector + " .ui.prosandcons.dropdown").dropdownX({
            allowAdditions: true,
        });
    },

    addItem: function (selector, list, group) {
        var duplicateItem = ProsAndCons.getDuplicateItem(list);

        jQuery(selector + " [data-repeater-create]").on("click", function () {
            var indexedItem = ProsAndCons.setIndex(list, duplicateItem, group);

            list.append(indexedItem);
            ProsAndCons.deleteItem(selector, list, group);
            ProsAndCons.reinitiateEvents(list, group);

            // Pros and Cons Dropdown Items
            jQuery(selector + " .ui.prosandcons.dropdown").dropdownX({
                allowAdditions: true,
            });
        });
    },

    getDuplicateItem: function (list) {
        var item = list
            .find("[data-repeater-item]")
            .first()[0].outerHTML;
        var placeholderText = '<option value="">Type new or select a existing one</option>';
        item = item.replace(new RegExp('<option[^>]*>.*?<\/option>'), placeholderText);

        return item;
    },

    deleteItem: function (selector, list, group) {
        jQuery(selector + " [data-repeater-item] [data-repeater-delete]").on(
            "click",
            function () {
                jQuery(this)
                    .parent()
                    .parent()
                    .remove();
                ProsAndCons.updateIndex(list, group);
                ProsAndCons.reinitiateEvents(list, group);
            }
        );
    },

    reinitiateEvents: function (list, group) {
        ProsAndCons.setRules(list, group);
        Form.formValidation(formRules);
    },

    setIndex: function (list, item, dataAttr) {
        var key = list.children().length;

        var field = jQuery(item);

        var indexedField = field
            .find("[data-" + dataAttr + "]")
            .attr("name", dataAttr + "[" + key + "]")
            .parent()
            .parent()
            .html();

        var fieldHtml = field.html(indexedField);
        var indexedHtml = fieldHtml
            .wrapAll("<div>")
            .parent()
            .html();

        return indexedHtml;
    },

    updateIndex: function (list, group) {
        var items = list.find("[data-repeater-item]");

        var count = 0;
        items.each(function (index, item) {
            jQuery(item)
                .find("[data-" + group + "]")
                .attr("name", group + "[" + count + "]");
            count++;
        });
    },

    setRules: function (list, group) {
        var items = list.find("[data-repeater-item]");
        items.each(function (index, item) {
            var field = jQuery(item)
                .find("[data-" + group + "]")
                .attr("name");
            formRules[field] = ProsAndCons.updateRules(field, group);
        });
    },

    updateRules: function (identifier, group) {
        return {
            identifier: identifier,
            rules: [
                {
                    type: "empty",
                    prompt: "Please select or type a " + group,
                },
            ],
        };
    },
};

module.exports = ProsAndCons;
