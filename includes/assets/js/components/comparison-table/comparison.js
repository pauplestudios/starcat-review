var Search = require("./search.js");
var ComparisonTable = {
    init: function() {
        console.log('Comparison Table Loaded !!!');               
        Search.init();
        this.eventHandlers();
    },   

    eventHandlers: function(){    	
    	
    }

};

module.exports = ComparisonTable;
    