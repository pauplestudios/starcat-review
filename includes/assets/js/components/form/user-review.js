var UserReview = {

    init: function() {
        this.eventListener();
        console.log('UserReview JS Loaded !!!');               
    },   

    eventListener: function(){
        var review = jQuery('.hrp-review-list.user-review');           
        
        var limit = (review.attr("data-valueType") == 'percentage') ? 100 : review.attr("data-limit");

        var props = {
            review : review,
            limit : limit,
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
                "",
                props
            );
        }else if(props.reviewType == 'progress_bar'){            
            this.getRatingEventlistener(
                ".hrp-review-list.user-review .single-progress-review__wrapper",
                ".single-progress-review__results", 
                ".single-progress-review__label",
                ".single-progress-review__text", 
                props
            ); 
        }       
    },  

    getRatingEventlistener: function(wrapper, result, label, text, props){   
     
        jQuery(wrapper).on('mousemove', function(e) {
			var thisElement = jQuery(this);
            var offset = thisElement.offset().left;
            var width = ( ( ( e.pageX - offset ) / thisElement.width() ) * 100 ).toFixed();
            var starValue, numberValue;           
			
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

                width = UserReview.getNumberDivision(width, props); 
                numberValue = (props.valueType == 'number')? width /(100 / props.limit): width;

                thisElement.next(label).find("span").text(numberValue +' / ' + props.limit).attr("data-rating", numberValue);                
                thisElement.attr("title", numberValue +' / ' + props.limit);
                thisElement.find(text).text(numberValue);
                
            }
            
            thisElement.find(result).width(width + '%').attr("value", width);

        }).on('mouseleave', function(){

            var thisElement = jQuery(this);            
            var ratingValue = thisElement.find(result).attr("data-rating");
            var width = UserReview.getWidthByReviewType(ratingValue, props);            
            
            thisElement.find(result).width(width + '%').attr("value", width).attr("data-rating", ratingValue);
            thisElement.next(label).find("span").text(ratingValue +' / ' + ((props.reviewType == 'star')?props.scale:props.limit)).attr("data-rating", ratingValue);            
            thisElement.find(text).text(ratingValue);

        }).on("click", function(){

            var thisElement = jQuery(this);
            var ratingValue = thisElement.next(label).find("span").attr("data-rating");            
            var width = UserReview.getWidthByReviewType(ratingValue, props);     
            
            thisElement.find(result).width(width + '%').attr("value", width).attr("data-rating", ratingValue);            
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

    getNumberDivision: function(width, props){
        
        if(props.valueType == 'number'){
            divisor = 100 / props.limit;
			return Math.round(width / divisor) * divisor;            
        }

        return width;
    },

    getWidthByReviewType: function(ratingValue, props){
        var width = ratingValue/props.scale * 100;    
        if(props.reviewType == 'progress_bar'){  
            width = ratingValue /props.limit * 100;
        }
        return width;
    }
};

module.exports = UserReview;
    