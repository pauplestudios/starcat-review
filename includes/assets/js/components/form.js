require('jquery.repeater');

var Form = {
    init: function() {    
        this.userReview();      
        this.prosAndCons();
        this.formSubmit();       

        console.log('Form JS Loaded !!!'); 
    },   
    
    userReview: function(){        

        var review = jQuery('.hrp-review-list.user-review');
        
        var wrapper, result, label;

        var props = {
            review : review,
            limit : review.attr("data-limit"),
            valueType : review.attr("data-valueType"),
            reviewType : review.attr("data-reviewType"),
            scale: review.attr("data-scale"),
            segment: review.attr("data-segment"),          
        };        

        if(props.reviewType == 'star'){

            wrapper ='.hrp-review-list.user-review .single-review';
            result = '.single-review__results';
            label = 'single-progress-review__text';

            this.getRatingEventlistener(wrapper, result, label, props);
        }

        if(props.reviewType == 'progress_bar'){

            wrapper = ".hrp-review-list.user-review .single-progress-review__wrapper";
            result = ".single-progress-review__results";
            label = ".single-progress-review__text";

        this.getRatingEventlistener(wrapper, result, label, props);        
        }

        
    },

    getRatingEventlistener: function(wrapper, result, label, props){   
     
        jQuery(wrapper).on('mousemove', function(e) {
			var thisElement = jQuery(this);
            var offset = thisElement.offset().left;
			var width = ( ( ( e.pageX - offset ) / thisElement.width() ) * 100 ).toFixed();           
			
			if ( width <= 0 ) {
  				width = 0;
			}
			if ( width > 100 ) {
				width = 100;
            }

            if(props.reviewType == 'star'){
                width = Form.getStarSegment(width, props);
            }            

            thisElement.find(result).width(width + '%').attr("data-valuenow", width);            
            thisElement.find(label).text(width +' / 100');
        });
    },

    getStarSegment: function(width, props){
        var divisor;
        switch(props.segment) {
            case 'half':
                console.log("Segment switch")
                divisor = (props.scale === 5)?20:10;
                return width = Math.round(width / divisor) * divisor;
            case 'full':
                divisor = (props.scale == 5)?20:10;                    
                return width = Math.round(width / divisor) * divisor;
                
            case 'point':                
                return width;
            default:
                return width;
          }
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

        this.getRepeater('.review-pros-repeater');
        this.getRepeater('.review-cons-repeater');

    },
    
    getRepeater: function(selector){
        
        jQuery(selector).repeater({             
            show: function () {
                jQuery(this).fadeIn();

                jQuery(selector+' .ui.dropdown').dropdown({
                    allowAdditions: true
                });
            },  
            hide: function (deleteElement) {              
                jQuery(this).fadeOut(deleteElement);
            },               					        
            // isFirstItemUndeletable: true,					
          });
          
          jQuery(selector+' .ui.dropdown').dropdown({
            allowAdditions: true
        });
    },

};

module.exports = Form;
    