// const repeater = require('jquery.repeater');
var Ratings = {
    init: function() {
        console.log('Ratings JS Loaded !!!');               
		this.animateRating();
		this.userRating();
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
	},
	userRating: function(){
		jQuery('.ui.star.rating').rating('enable');				  		

		jQuery(".range-slider__range").mousemove(function(){
			jQuery(".slider__value").text(jQuery(this).val());
		});

		jQuery("#hrp-form .ui.dropdown.pros").dropdown({
			allowAdditions: true,						
		});
		jQuery("#hrp-form .ui.dropdown.cons").dropdown({
			allowAdditions: true,						
		});

	},	

};

module.exports = Ratings;
    