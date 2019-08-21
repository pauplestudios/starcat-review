require('jquery.repeater');

var Form = {
    init: function() {
        console.log('Form JS Loaded !!!'); 
        this.prosAndCons();
        this.formSubmit();
        this.userReview();
    },   
    
    userReview: function(){
        // jQuery(".hrp-review-list.user-review .single-review__wrapper").mousemove(function(){

        //     console.log(this);
		// 	// jQuery(".single-review__results").width(jQuery(this).val());
        // });
        
        jQuery(".hrp-review-list.user-review .single-progress-review__wrapper").on('mouseenter mousemove mouseleave', function(e) {
			var thisModule = jQuery(this);
            var offset = thisModule.offset().left;
			var width = ( ( ( e.pageX - offset ) / thisModule.width() ) * 100 ).toFixed();
           

			// snap to nearest 5
			// width = Math.round(width / 5) * 5;

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
            isFirstItemUndeletable: true,					
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
            isFirstItemUndeletable: true,					
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
    