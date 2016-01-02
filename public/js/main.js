$(document).ready(function(){

var y = 0;
$(function() {
  $("#clicksi").click(function() {
    if (y == 0) {
      $(".signinform").animate({"right": '+=400px'}, 'slow');
    	y = 1;
    } else {
      $(".signinform").animate({"right": '-=400px'}, 'slow');
      y = 0;
    }
  });
});
});