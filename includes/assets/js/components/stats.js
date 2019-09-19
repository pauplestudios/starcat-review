var Stats = {
    init: function() {
        console.log("Stats JS Loaded !!!");
        this.eventListener();
    },

    eventListener: function() {
        const review = jQuery(".review-list");

        const props = {
            type: review.attr("data-type"),
            limit: review.attr("data-limit"),
            valueType: review.attr("data-valuetype")
        };

        this.getRating(".review-item-stars", ".stars-result", props);
        this.getRating(
            ".review-item-bars .bars-wrapper",
            ".bars-result",
            props
        );
    },

    getRating: function(ratingElement, resultElement, props) {
        jQuery(ratingElement)
            .on("mousemove", function(e) {
                let element = jQuery(this);
                let offset = element.offset().left;
                let fixedWidth = (
                    ((e.pageX - offset) / element.width()) *
                    100
                ).toFixed();

                if (fixedWidth <= 0) {
                    offsetWidth = 0;
                }
                if (fixedWidth > 100) {
                    fixedWidth = 100;
                }

                let width = Stats.getWidth(fixedWidth, props);
                let score = Stats.getScore(width, props);

                element = props.type == "bar" ? element.parent() : element;

                // Update Score
                element
                    .siblings(".review-item-label")
                    .find(".review-item-label__score")
                    .text(score);

                // Update Width
                element.find(resultElement).width(width + "%");

                // Update Title and score
                element
                    .attr("title", score + " / " + props.limit)
                    .find(".bars-score")
                    .text(score + " / " + props.limit);

                // Update Result
                element.attr("result", width);
            })
            .on("mouseleave", function() {
                let element = jQuery(this);
                element = props.type == "bar" ? element.parent() : element;
                let value = element.find("input").val();
                let score = Stats.getScore(value, props);

                // Update Score
                element
                    .siblings(".review-item-label")
                    .find(".review-item-label__score")
                    .text(score);

                // Update Width
                element.find(resultElement).width(value + "%");

                // Update Title and score
                element
                    .attr("title", score + " / " + props.limit)
                    .find(".bars-score")
                    .text(score + " / " + props.limit);

                // Update Result
                element.attr("result", value);
            })
            .on("click", function() {
                let element = jQuery(this);
                element = props.type == "bar" ? element.parent() : element;
                let value = element.attr("result");

                // Update Hidden Input Value
                element.find("input").val(value);
            });
    },

    getWidth: function(fixedWidth, props) {
        let divisor, width;

        switch (props.valueType) {
            case "full":
                divisor = props.limit == 5 ? 20 : 10;
                width = Math.round(fixedWidth / divisor) * divisor;
                break;

            case "half":
                divisor = props.limit == 5 ? 10 : 5;
                width = Math.round(fixedWidth / divisor) * divisor;
                break;

            case "point":
                divisor = 100 / props.limit;
                width =
                    props.type == "star"
                        ? fixedWidth
                        : Math.round(fixedWidth / divisor) * divisor;
                break;
            case "percentage":
                width = fixedWidth;
                break;

            default:
                width = Math.round(width / 20) * 20;
        }

        return width;
    },

    getScore: function(width, props) {
        let score;

        score = props.limit == 10 ? width / 10 : width / 20;
        score = props.valueType == "point" ? score.toFixed(1) : score;

        if (props.type == "bar") {
            score =
                props.valueType == "point"
                    ? width / (100 / props.limit)
                    : width;
        }

        return score;
    }
};

module.exports = Stats;
