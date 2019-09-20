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

        this.getRatingStat(".review-item-stars", ".stars-result", props);
        this.getRatingStat(
            ".review-item-bars .bars-wrapper",
            ".bars-result",
            props
        );
    },

    getRatingStat: function(ratingElement, resultElement, props) {
        jQuery(ratingElement)
            .on("mousemove", function(e) {
                let element = jQuery(this);
                let elmentOffsetLeft = element.offset().left;
                let elementWidth = (
                    ((e.pageX - elmentOffsetLeft) / element.width()) *
                    100
                ).toFixed();

                if (elementWidth <= 0) {
                    elementWidth = 0;
                }
                if (elementWidth > 100) {
                    elementWidth = 100;
                }

                let statWidth = Stats.getStatWidth(elementWidth, props);
                let score = Stats.getStatScore(statWidth, props);

                element = props.type == "bar" ? element.parent() : element;

                // Update Label Score
                element
                    .siblings(".review-item-label")
                    .find(".review-item-label__score")
                    .text(score);

                // Update Width
                element.find(resultElement).width(statWidth + "%");

                // Update Titlescore if it rendered
                element
                    .attr("title", score + " / " + props.limit)
                    .find(".bars-score")
                    .text(score + " / " + props.limit);

                // Update Result
                element.attr("result", statWidth);
            })
            .on("mouseleave", function() {
                let element = jQuery(this);
                element = props.type == "bar" ? element.parent() : element;
                let value = element.find("input").val();
                let score = Stats.getStatScore(value, props);

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

    getStatWidth: function(elementWidth, props) {
        let divisor, statWidth;

        switch (props.valueType) {
            case "full":
                divisor = props.limit == 5 ? 20 : 10;
                statWidth = Math.round(elementWidth / divisor) * divisor;
                break;

            case "half":
                divisor = props.limit == 5 ? 10 : 5;
                statWidth = Math.round(elementWidth / divisor) * divisor;
                break;

            case "point":
                divisor = 100 / props.limit;
                statWidth =
                    props.type == "star"
                        ? elementWidth
                        : Math.round(elementWidth / divisor) * divisor;
                break;
            case "percentage":
                statWidth = elementWidth;
                break;

            default:
                divisor = props.limit == 5 ? 20 : 10;
                statWidth = Math.round(elementWidth / divisor) * divisor;
        }

        return statWidth;
    },

    getStatScore: function(statValue, props) {
        let score;

        score = props.limit == 10 ? statValue / 10 : statValue / 20;
        score = props.valueType == "point" ? score.toFixed(1) : score;

        if (props.type == "bar") {
            score =
                props.valueType == "point"
                    ? statValue / (100 / props.limit)
                    : statValue;
        }

        return score;
    }
};

module.exports = Stats;
