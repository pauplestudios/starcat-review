var Ratings = {
    init: function() {
        console.log('Ratings JS Loaded !!!');               
        this.animateRating();
    },   

    animateRating: function(){    	
    	jQuery(".single-progress-review__results").each(function(){			
			each_bar_width = jQuery(this).attr('data-valuenow');			
			jQuery(this).width(each_bar_width + '%');			
		  });
		  
		jQuery(".single-review__results").each(function(){
			each_bar_width = jQuery(this).attr('data-valuenow');			
			jQuery(this).width(each_bar_width + '%');
  		});
    }

};

module.exports = Ratings;
    