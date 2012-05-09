jQuery(function(){
// Execute this code when the page is ready to work
// Create a Script Tag
 var script=document.createElement('script');
 script.type='text/javascript';
 script.src= "https://api.twitter.com/1/statuses/user_timeline.json?screen_name=coshxlabs&count=1&callback=processTweet"

// Add the Script to the Body element, which will in turn load the script and run it.
 $("body").append(script);
});

function replaceURLWithHTMLLinks(text) {
    var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
    return text.replace(exp,"<a href='$1'>$1</a>");
}

function processTweet(jsonData){
    var shtml = '';
    var results = jsonData[0];
    if(results){
        shtml += "<p>" + replaceURLWithHTMLLinks(results.text) + "</p><a class = 'dark-blue-arrow' href = 'https://www.twitter.com/coshxlabs'>Follow Us<div class=\"arrow\"></div></a>";
        $("#footer-tweet").html( shtml );
    }
}