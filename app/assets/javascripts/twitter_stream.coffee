replaceURLWithHTMLLinks = (text) ->
  exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/g
  text.replace exp, "<a href='$1'>$1</a>"

window.TweetProcessor = {}
TweetProcessor.process = (jsonData) ->
  shtml = ""
  results = jsonData[0]
  if results
    shtml += "<p>" + replaceURLWithHTMLLinks(results.text) + "</p><a class = 'a-button darkblue' href = 'https://www.twitter.com/coshxlabs'>Follow Us</a>"
    $("#footer-tweet").html shtml

$(document).on "page:load", ->
  # Create a Script Tag
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "https://api.twitter.com/1/statuses/user_timeline.json?screen_name=coshxlabs&count=1&callback=TweetProcessor.process"
  # Add the Script to the Body element, which will in turn load the script and run it.
  $("body").append script
