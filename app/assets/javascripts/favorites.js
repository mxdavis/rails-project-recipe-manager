
//  $('span.favorites').on('click', function(e){ 
//      e.preventDefault()
//     console.log('hello')        
// });

// var j = jQuery.noConflict();

    $(document).on("click", "span.favorites", function(e){ // This is the changed line
        e.preventDefault()
        console.log("Clicked");
    });
