$(document).ready(function() {
  $(".modal.permalink").each(function(){
    if(window.location.href.indexOf($(this).attr("id")) != -1){
      var offset = $("#team-header").offset().top - $("#site-header").outerHeight();
      $('html, body').animate({scrollTop: offset}, 1);
      $(this).modal('show');
    }
  });
});