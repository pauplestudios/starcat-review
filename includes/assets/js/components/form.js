var ProsAndCons = require("./form/pros-and-cons.js");
var UserReview = require("./form/user-review.js");

var Form = {
    init: function() {    
        UserReview.init();
        ProsAndCons.init();
              
        this.formSubmit();       

        console.log('Form JS Loaded !!!'); 
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

};

module.exports = Form;
    