require("./../../../../vendors/like-dislike.js");
var Voting = {
    init: function () {
        console.log("Voting Js Init !");
        this.eventListener();
    },
    eventListener: function () {
        jQuery(".vote.likes-and-dislikes").likeDislike({
            initialValue: 0,
            click: function (value, l, d, event) {
                var element = jQuery(this.element);
                var likes = element.find(".likes");
                var dislikes = element.find(".dislikes");

                likes.text(parseInt(likes.text()) + l);
                dislikes.text(parseInt(dislikes.text()) + d);

                props = {
                    action: "scr_user_review_vote",
                    type: "post",
                    comment_id: element.attr("data-comment-id"),
                    vote: value,
                };

                console.log(props);

                jQuery.post(scr_ajax.ajax_url, props, function (results) {
                    results = JSON.parse(results);
                    console.log(results);
                });
            },
        });
    },
};

module.exports = Voting;
