require('jquery.repeater');

var Form = {
    init: function() {
        console.log('Form JS Loaded !!!'); 
        this.prosAndCons();
        this.formSubmit();
        this.userReview();
    },   
    
    userReview: function(){
        var review = jQuery('.hrp-review-list.user-review');

        var limit = review.attr("data-limit"),
            valueType = review.attr("data-valueType"),
            type = review.attr("data-type"),
            scale = review.attr("data-scale"),
            segment = review.attr("data-segment"),
            divisor;
        
        jQuery(".hrp-review-list.user-review .single-review").on('mousemove', function(e) {
			var thisModule = jQuery(this);
            var offset = thisModule.offset().left;
			var width = ( ( ( e.pageX - offset ) / thisModule.width() ) * 100 ).toFixed();           

			// No 0 or above 100 ratings allowed
			if ( width <= 0 ) {
  				width = 1;
			}
			if ( width > 100 ) {
				width = 100;
            }
            
            switch(segment) {
                case 'half':
                    divisor = (scale === 5)?20:10;
                    width = Math.round(width / 20) * 20;
                    break;
                case 'full':
                    divisor = (scale == 5)?20:10;
                    console.log("Divisor : " + divisor);
                    width = Math.round(width / divisor) * divisor;
                    break; 
                case 'point':
                // width = Math.round(width / 5) * 5;
                break;                
              }
            

            thisModule.find(".single-review__results").width(width + '%').attr("data-valuenow", width);            
            // thisModule.next('.single-progress-review__text').text(width +' / 100');
        });
        
        jQuery(".hrp-review-list.user-review .single-progress-review__wrapper").on('mouseenter mousemove mouseleave', function(e) {
			var thisModule = jQuery(this);
            var offset = thisModule.offset().left;
			var width = ( ( ( e.pageX - offset ) / thisModule.width() ) * 100 ).toFixed();

			// No 0 or above 100 ratings allowed
			if ( width <= 0 ) {
  				width = 1;
			}
			if ( width > 100 ) {
				width = 100;
            }            

            thisModule.find('.single-progress-review__results').width(width + '%').attr("value", width);            
            thisModule.find('.single-progress-review__text').text(width +' / 100');
		});
        
    },
   

    formSubmit: function(){        
        
        jQuery('.hrp-form').submit(function(e) {    
           
            var form = jQuery( this ), // this will resolve to the form submitted
            action = form.attr( 'action' ),
              type = form.attr( 'method' ),
              data = {};
     
            // Make sure you use the 'name' field on the inputs you want to grab. 
            form.find( '[name]' ).each( function( i , v ){
            var input = jQuery( this ), // resolves to current input element.
                name = input.attr( 'name' ),
                value = input.val();
            data[name] = value;
            });

            e.preventDefault();   
           console.log(data);
        });
    },

    formValidation: function(){
        // var form_data =jQuery('.hrp-form').form().get();             
        // console.log(JSON.stringify(form_data));
        console.log("Validation");
    },
	
	prosAndCons: function(){	
        
        jQuery('.review-pros-repeater').repeater({             
            show: function () {                
                jQuery(this).fadeIn();
                jQuery('.review-pros-repeater .ui.dropdown').dropdown({
                    allowAdditions: true
                });
            },
            hide: function (deleteElement) {                
                jQuery(this).fadeOut(deleteElement);
            }, 
            // isFirstItemUndeletable: true,					
          });
        
        jQuery('.review-cons-repeater').repeater({             
            show: function () {
                jQuery(this).fadeIn();

                jQuery('.review-cons-repeater .ui.dropdown').dropdown({
                    allowAdditions: true
                });
            },  
            hide: function (deleteElement) {              
                jQuery(this).fadeOut(deleteElement);
            },               					        
            // isFirstItemUndeletable: true,					
          }); 
        
        jQuery('.review-pros-repeater .ui.dropdown').dropdown({
            allowAdditions: true
        });
        
        jQuery('.review-cons-repeater .ui.dropdown').dropdown({
            allowAdditions: true
        });
	},	

};

module.exports = Form;
    