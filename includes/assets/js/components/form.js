require('jquery.repeater');

var Form = {
    init: function() {
        console.log('Form JS Loaded !!!'); 
		this.prosAndCons();
    },    
	
	prosAndCons: function(){	
        
        jQuery('.pros-semantic-repeater').repeater({             
            show: function () {                
                jQuery(this).fadeIn();
                jQuery('.pros-semantic-repeater .ui.dropdown').dropdown({
                    allowAdditions: true
                });
            },
            hide: function (deleteElement) {
                jQuery(this).fadeOut(deleteElement);
            }, 
            isFirstItemUndeletable: true,					
          });
        
        jQuery('.cons-semantic-repeater').repeater({             
            show: function () {
                jQuery(this).fadeIn();

                jQuery('.cons-semantic-repeater .ui.dropdown').dropdown({
                    allowAdditions: true
                });
            },  
            hide: function (deleteElement) {              
                jQuery(this).fadeOut(deleteElement);
            },               					        
            isFirstItemUndeletable: true,					
          }); 
        
        jQuery('.pros-semantic-repeater .ui.dropdown').dropdown({
            allowAdditions: true
        });
        
        jQuery('.cons-semantic-repeater .ui.dropdown').dropdown({
            allowAdditions: true
        });
      

	},	

};

module.exports = Form;
    