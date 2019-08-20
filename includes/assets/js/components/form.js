require('jquery.repeater');

var Form = {
    init: function() {
        console.log('Form JS Loaded !!!'); 
        this.prosAndCons();
        this.formSubmit();
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
    