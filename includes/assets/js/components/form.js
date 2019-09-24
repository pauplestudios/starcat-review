var ProsAndCons = require("./form/pros-and-cons.js");

var Form = {
    init: function() {            
        ProsAndCons.init();
              
        this.formSubmit();       

        console.log('Form JS Loaded !!!'); 
    },   

    formSubmit: function(){   

        jQuery('.hrp-form').submit(function(e) {    
            
            e.preventDefault();   

            var form = jQuery( this ), 
            action = form.attr( 'action' ),
              type = form.attr( 'method' ),
              data = {}, items = {}, pros = {}, cons = {};                               
            
            form.find( '[name]' ).each( function( i , v ){                
                var input = jQuery( this ),
                    name = input.attr( 'name' ),
                    value = input.val();
                data[name] = value;                
            });
            
            // User Stat
            form.find('[data-group]').each( function(){                
                var input = jQuery( this ), 
                    name = input.attr( 'data-item-name' ),
                    value = input.val();         
                    
                    items[name] = value;                    
            }); 
            data['items'] = items;               
            
            // Pros 
            form.find('[data-pros]').each(function(i){
                var input = jQuery( this ),                     
                    value = input.val();                             
                    pros[i] = value; 
            });
            data['pros'] = pros;

            // Cons
            form.find('[data-cons]').each(function(i){
                var input = jQuery( this ),                     
                    value = input.val();                             
                    cons[i] = value; 
            });          
            data['cons'] = cons;
           
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
    