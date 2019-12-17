require("./../../../vendors/like-dislike.js");
var Voting = {
    init: function() {
        console.log("Voting Js Init !");
        this.eventListener();
    },
    eventListener: function() {
        jQuery(".vote.likes-and-dislikes").likeDislike({
            initialValue: 0,
            click: function(value, l, d, event) {
                var likes = jQuery(this.element).find(".likes");
                var dislikes = jQuery(this.element).find(".dislikes");

                likes.text(parseInt(likes.text()) + l);
                dislikes.text(parseInt(dislikes.text()) + d);
                // console.log();
                // jQuery(this.element)
                //     .find("a.like i")
                //     .toggleClass("outline");
                // // if()
                // jQuery(this.element)
                //     .find("a.dislike i")
                //     .toggleClass("outline");
                // console.log(dislikes);
                console.log(
                    "Like : " +
                        l +
                        " ** " +
                        "Dislike : " +
                        d +
                        " ** Value : " +
                        value
                );

                console.log(event);
                // jQuery.ajax({
                //     url: "url",
                //     type: "post",
                //     data: "value=" + value,
                // });
            },
        });
    },
};

module.exports = Voting;
