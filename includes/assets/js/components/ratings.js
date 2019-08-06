var Ratings = {
    init: function() {
        console.log('Ratings JS Loaded !!!');
        this.progressBar(75, jQuery('.progress'));
    },

    progressBar: function(percent, $element)
    {     
        var progressBarWidth = percent * $element.width() / 100;
        $element.find('.progress-bar').animate({ width: progressBarWidth }, 500).html(percent + "%&nbsp;");
    }
};

module.exports = Ratings;
    