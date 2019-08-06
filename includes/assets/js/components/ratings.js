var Ratings = {
    init: function() {
        console.log('Ratings JS Loaded !!!');
        
        // this.progressBar(75, jQuery('.progress'));
        jQuery(".progress").mouseover(function(){
            alert("Mouse Over");
        });
        
    },

    progressBar: function(percent, $element)
    {     
        var progressBarWidth = percent * $element.width() / 100;
        $element.find('.progress-bar').animate({ width: progressBarWidth }, 500).html(percent + "%&nbsp;");
    },

    progressBarRating : function(element){
        element.on('click','.progress-bar', function(e){
            e.preventDefault();
            alert("Clicked");
        });

        // jQuery($element).on('mouseenter mousemove', function($e){
        //     console.log($e.width());
        // });
    },

    userRatingEvent: function(rate) {
        console.log(rate);
		var $wrapper;
		$wrapper = this;		

		$wrapper.find('.review-result').each(function() {
			var $this = $(this);
			$this.closest('.progress-bar').data('originalwidth', $this[0].style.width);
		});

		$wrapper.find('.progress-bar').click(function(e) {
			var $this = $(this);
			var offset = $this.offset().left;
			var width = ( ( ( e.pageX - offset ) / $this.width() ) * 100 ).toFixed();
			// if ( $('body').hasClass('rtl') ) {
			// 	width = ( 100 - ( ( ( e.pageX - offset ) / $this.width() ) * 100 ) ).toFixed();
			// }


			// snap to nearest 5
			// width = Math.round(width / 5) * 5;

			// no 0-star ratings allowed
			if ( width <= 0 ) {
  				width = 1;
			}
			if ( width > 100 ) {
				width = 100;
			}

			$this.find('.review-result').width(width + '%');
			$this.data('originalrating', width );
			$this.data('originalwidth', $this.find('.review-result')[0].style.width);

			$wrapper.addClass('wp-review-input-set');

			// set input value
			$wrapper.find('.wp-review-user-rating-val').val( width );

			if ( typeof options.rate == 'function' ) {
				options.rate.call( $wrapper, parseFloat( width ) );
			}
		}).on('mouseenter mousemove', function(e) {
			var $this = $(this);
			var offset = $this.offset().left;
			var width = ( ( ( e.pageX - offset ) / $this.width() ) * 100 ).toFixed();
			// if ( $('body').hasClass('rtl') ) {
			// 	width = ( 100 - ( ( ( e.pageX - offset ) / $this.width() ) * 100 ) ).toFixed();
			// }

			// snap to nearest 5
			// width = Math.round(width / 5) * 5;

			// no 0-star ratings allowed
			if ( width <= 0 ) {
  				width = 1;
			}
			if ( width > 100 ) {
				width = 100;
			}

			$this.find('.review-result').width(width + '%');

			if ( $('body').hasClass('rtl') ) {
				$wrapper.find('.wp-review-your-rating').css('right', width + '%').find('.wp-review-your-rating-value').text(''+width+'%');
			} else {
				$wrapper.find('.wp-review-your-rating').css('left', width + '%').find('.wp-review-your-rating-value').text(''+width+'%');
			}

		}).on('mouseleave', function(e){
			var $this = $(this);
			$this.find('.review-result').width($this.data('originalwidth'));
			$wrapper.find('.wp-review-your-rating-value').text($this.data('originalrating')+'%');
		});
	}


};

module.exports = Ratings;
    