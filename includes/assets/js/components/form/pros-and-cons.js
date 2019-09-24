require('jquery.repeater');

var ProsAndCons = {

    init: function() {
        this.eventListener();                  
    },   

    eventListener: function(){
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

module.exports = ProsAndCons;
    