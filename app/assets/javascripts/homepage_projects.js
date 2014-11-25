$(document).ready(function() {
    $('.project-description').hide();
  $('.featured-project-link').hover(function() {
    $('.project-description').hide();
    var rowNumber = this.parentElement.parentElement.classList[2].slice(-1)
    var displayClass = ".project-description-" + rowNumber
    $(displayClass).show();
  });
});