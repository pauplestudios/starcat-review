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
            division: review.attr("data-division"),          
        };        

        if(props.reviewType == 'star'){
            this.getRatingEventlistener(
                ".hrp-review-list.user-review .single-review", 
                ".single-review__results",
                ".single-review__label",
                props
            );
        }else if(props.reviewType == 'progress_bar'){            
            this.getRatingEventlistener(
                ".hrp-review-list.user-review .single-progress-review__wrapper",
                ".single-progress-review__results", 
                ".single-progress-review__label", 
                props
            ); 
        }       
    },  

    getRatingEventlistener: function(wrapper, result, label, props){   
     
        jQuery(wrapper).on('mousemove', function(e) {
			var thisElement = jQuery(this);
            var offset = thisElement.offset().left;
            var width = ( ( ( e.pageX - offset ) / thisElement.width() ) * 100 ).toFixed();
            var starValue;           
			
			if ( width <= 0 ) {
  				width = 0;
			}
			if ( width > 100 ) {
				width = 100;
            }

            if(props.reviewType == 'star'){
                width = UserReview.getStarDivison(width, props);                
                starValue = (props.scale == 10)?width / 10 : width / 20;
                thisElement.next(label).find("span").text(starValue +' / ' + props.scale).attr("data-rating", starValue);
                thisElement.find(result).attr("title", starValue +' / ' + props.scale);
            }            
            
            if(props.reviewType == 'progress_bar'){                            
                // thisElement.find(label).attr("class")
                console.log("Text : " + thisElement.next(label).find('span').text());
            }
            
            thisElement.find(result).width(width + '%').attr("value", width);
            thisElement.find(label).text(width +' / 100');        
            

        }).on('mouseleave', function(){

            var thisElement = jQuery(this);
            var starValue = thisElement.find(result).attr("data-rating") || 0;
            var width = starValue/props.scale * 100;

            thisElement.find(result).width(width + '%').attr("value", width).attr("data-rating", starValue);
            thisElement.next("span").find(".single-review__label").text(starValue +' / ' + props.scale).attr("data-rating", starValue);

        }).on("click", function(){

            var thisElement = jQuery(this);
            var starValue = thisElement.next("span").find(".single-review__label").attr("data-rating");            
            var width = starValue/props.scale * 100;            
            
            thisElement.find(result).width(width + '%').attr("value", width).attr("data-rating", starValue);
        });
    },

    getStarDivison: function(width, props){        
        switch(props.division) {
            case 'half':
                var divisor = (props.scale == 5)?10:5;                
                return Math.round(width / divisor) * divisor;            
            case 'point':                
                return width;

            default:
                return Math.round(width / 20) * 20;
          }
    },

    getProgressNumber: function(width, props){
        var progressNumber;

        if(props.valueType == 'number'){
            divisor = 100 / props.limit;
			limit = width / divisor;            
            return number;
        }

        return progressNumber;
    }
};

module.exports = UserReview;
    