var UserReview = {

    init: function() {
        this.eventListener();
        console.log('UserReview JS Loaded !!!');               
    },   

    eventListener: function(){
        var review = jQuery('.hrp-review-list.user-review');   

        var props = {
            review : review,
            limit : review.attr("data-limit"),
            valueType : review.attr("data-valueType"),
            reviewType : review.attr("data-reviewType"),
            scale: review.attr("data-scale"),
            segment: review.attr("data-segment"),          
        };        

        if(props.reviewType == 'star'){
            this.getRatingEventlistener(
                ".hrp-review-list.user-review .single-review", 
                ".single-review__results",
                "span",
                props
            );
        }else if(props.reviewType == 'progress_bar'){            
            this.getRatingEventlistener(
                ".hrp-review-list.user-review .single-progress-review__wrapper",
                ".single-progress-review__results", 
                ".single-progress-review__text", 
                props
            ); 
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
                width = UserReview.getStarSegment(width, props);
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
};

module.exports = UserReview;
    