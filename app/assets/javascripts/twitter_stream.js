function twitterCallback2(username, text, id_str, created_at) {
  var statusHTML = [];
  var status = text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
    return '<a target="_blank" href="'+url+'">'+url+'</a>';
  }).replace(/(\B@)([_a-z0-9]+)/ig, function(reply) {
    return reply.charAt(0)+'<a target="_blank" href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
  }).replace(/(\B#)([_a-z0-9]+)/ig, function(reply) {
    return reply.charAt(0)+'<a target="_blank" href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
  });

  statusHTML.push('<li><span>'+status+'</span> <br><br> <div class="days"><a target="_blank" href="http://twitter.com/'+username+'/statuses/'+id_str+'">'+relative_time(created_at)+'</a></div></li>');

  document.getElementById('tweet-box').innerHTML = statusHTML.join('');
}

function relative_time(parsed_date) {
  // alert(time_value);
  // var values = time_value.split(" ");
  // time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
  // alert(new Date().getTime());
  // alert(time_value);

  var parsed_date = Date.parse(parsed_date);
  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
  delta = delta + (relative_to.getTimezoneOffset() * 60);

  if (delta < 60) {
    return 'less than a minute ago';
  } else if(delta < 120) {
    return 'about a minute ago';
  } else if(delta < (60*60)) {
    return (parseInt(delta / 60)).toString() + ' minutes ago';
  } else if(delta < (120*60)) {
    return 'about an hour ago';
  } else if(delta < (24*60*60)) {
    return 'about ' + (parseInt(delta / 3600)).toString() + ' hours ago';
  } else if(delta < (48*60*60)) {
    return '1 day ago';
  } else {
    return (parseInt(delta / 86400)).toString() + ' days ago';
  }
}