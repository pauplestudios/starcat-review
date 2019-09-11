var Ratings = {
    init: function() {
        console.log('Ratings JS Loaded !!!');               
		this.animateRating();
		this.userRating();
    },   

    animateRating: function(){    	
    	jQuery(".single-bar-review__results").each(function(){			
			each_bar_width = jQuery(this).attr('value');			
			jQuery(this).width(each_bar_width + '%');			
		  });
		  
		jQuery(".single-review__results").each(function(){
			each_bar_width = jQuery(this).attr('value');			
			jQuery(this).width(each_bar_width + '%');
  		});
	},

	userRating: function(){				  		

		jQuery(".range-slider .range").mousemove(function(){
			jQuery(".range__value").text(jQuery(this).val());
		});
	},	

};

module.exports = Ratings;
    