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

$(".menubutton").click(function(){
        $(".menulightbox").fadeIn(2000)
    });

$(".menucloseicon").click(function(){
        $(".menulightbox").fadeOut(2000)
    });

$(".button2").click(function(){
        $("#newowner").fadeIn(2000)
    });
$(".button1").click(function(){
        $("#newuser").fadeIn(2000)
    });
$("#nucloseicon").click(function(){
        $(".lightbox").fadeOut(2000)
    });
$("#nocloseicon").click(function(){
        $(".lightbox").fadeOut(2000)
    });

});
