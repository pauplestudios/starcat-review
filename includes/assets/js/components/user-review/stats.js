var Stats = {
    init: function() {
        console.log("Stats JS Loaded !!!");
        this.eventListener();
    },

    eventListener: function() {
        this.getReviewStat();
        this.getReviewedStat();
    },

    getReviewedStat: function() {
        // Animating Reviewed Stat
        const reviewed = jQuery(".reviewed-list");
        const animate = reviewed.attr("data-animate");

        if (animate == "1") {
            reviewed.find(".reviewed-item").each(function(i) {
                let reviewedItem = jQuery(this);
                let value = reviewedItem.find("input[name]").attr("value");

                reviewedItem
                    .find(".stars-result")
                    .css({ transition: "width 1s", width: value + "%" });
                reviewedItem
                    .find(".bars-result")
                    .css({ transition: "width 1s", width: value + "%" });
            });
        }
    },

    getReviewStat: function() {
        const review = jQuery(".review-list");

        const props = {
            type: review.attr("data-type"),
            limit: review.attr("data-limit"),
            steps: review.attr("data-steps"),
            noRatedMessage: review.attr("data-no-rated-message")
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
            .on("mousemove touchmove", function(e) {
                let element = jQuery(this);
                let elmentOffsetLeft = element.offset().left;
                let pageX = e.pageX || e.originalEvent.touches[0].pageX;
                let elementWidth = (
                    ((pageX - elmentOffsetLeft) / element.width()) *
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
                    // .attr("title", score + " / " + props.limit)
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
                score =
                    score != 0
                        ? score + " / " + props.limit
                        : props.noRatedMessage;
                element
                    .attr("title", score)
                    .find(".bars-score")
                    .text(score);

                // Update Result
                element.attr("result", value);
            })
            .on("click touchmove", function() {
                let element = jQuery(this);
                element = props.type == "bar" ? element.parent() : element;
                let value = element.attr("result");

                // Update Hidden Input Value
                element.find("input").val(value);
            });
    },

    getStatWidth: function(elementWidth, props) {
        let divisor, statWidth;

        switch (props.steps) {
            case "full":
                divisor = props.limit == 5 ? 20 : 10;
                statWidth = Math.round(elementWidth / divisor) * divisor;
                break;

            case "half":
                divisor = props.limit == 5 ? 10 : 5;
                statWidth = Math.round(elementWidth / divisor) * divisor;
                break;

            case "precise":
                statWidth = elementWidth;
                break;

            default:
                // Default is Star 5
                divisor = props.limit == 5 ? 20 : 10;
                statWidth = Math.round(elementWidth / divisor) * divisor;
        }

        return statWidth;
    },

    getStatScore: function(statValue, props) {
        let score;

        score = statValue / (100 / props.limit);
        score = props.steps == "precise" ? score.toFixed(1) : score;

        return score;
    }
};

module.exports = Stats;
